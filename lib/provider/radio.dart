import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:radio/exceptions/radio_player_exception.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/frequently_played.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/provider/radio_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'radio.g.dart';

@riverpod
class Radio extends _$Radio {
  final _subscription = CompositeSubscription();

  late final _audioPlayer = AudioPlayer();

  // Internal variables
  /// After error setting url this field is true. Then when trying to play
  /// radio again we need to reset the url to focused station.
  bool _needUrlReset = false;

  @override
  RadioState build() {
    ref.onDispose(() {
      _subscription.dispose();
      _audioPlayer.dispose();
    });

    _listenUpdates();
    return const RadioState();
  }

  Future<void> setFocusedStation(RadioStation station) async {
    if (state.station == station && _audioPlayer.playing && !_needUrlReset) {
      return;
    }

    state = state.copyWith(
      station: station,
      bitRate: null,
      error: null,
      streamingState: StreamingState.buffering,
      title: null,
      playerState: RadioPlayerState.idle,
    );
    final playerTag = MediaItem(
      id: station.id,
      title: station.name,
      duration: Duration.zero,
      artUri: Uri.tryParse(station.imageUrl),
    );
    if (_audioPlayer.playing) {
      await _audioPlayer.stop();
    }

    Uri streamUri;
    if (kIsWeb) {
      streamUri = Uri.parse(station.streamUrl).replace(scheme: 'https');
    } else {
      streamUri = Uri.parse(station.streamUrl);
    }

    try {
      await _tryLoadAndPlay(streamUri, playerTag);
      ref.read(frequentlyPlayedProvider.notifier).recordPlay(station.id);
      _needUrlReset = false;
    } on PlayerInterruptedException catch (_) {
      _needUrlReset = true;
      state = state.copyWith(streamingState: null);
    } on Exception catch (_) {
      _needUrlReset = true;
      state = state.copyWith(
        error: StationLoadException(),
        streamingState: null,
      );
    }
  }

  Future<void> play() async {
    await setFocusedStation(state.station!);
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _needUrlReset = true;
  }

  void _listenUpdates() {
    _audioPlayer.playerStateStream
        .listen((event) {
          StreamingState? getStreamingState() {
            if (event.processingState == ProcessingState.buffering ||
                event.processingState == ProcessingState.loading) {
              return StreamingState.buffering;
            }
            if (event.playing) {
              return StreamingState.playing;
            }
            return null;
          }

          RadioPlayerState getPlayerState() {
            if (!event.playing &&
                (event.processingState == ProcessingState.idle ||
                    event.processingState == ProcessingState.ready)) {
              return RadioPlayerState.stopped;
            }

            return RadioPlayerState.started;
          }

          state = state.copyWith(
            playerState: getPlayerState(),
            streamingState: getStreamingState(),
          );
        })
        .addTo(_subscription);

    _audioPlayer.icyMetadataStream
        .listen((event) {
          state = state.copyWith(
            bitRate: event?.headers?.bitrate,
            title: event?.info?.title,
          );
        })
        .addTo(_subscription);
  }

  Future<void> _tryLoadAndPlay(Uri uri, MediaItem tag) async {
    try {
      await _audioPlayer
          .setAudioSource(AudioSource.uri(uri, tag: tag))
          .timeout(const Duration(seconds: 10));
    } on PlayerInterruptedException {
      rethrow;
    } on Exception catch (_) {
      // One retry on transient failure.
      await Future<void>.delayed(const Duration(seconds: 2));
      await _audioPlayer
          .setAudioSource(AudioSource.uri(uri, tag: tag))
          .timeout(const Duration(seconds: 10));
    }
    unawaited(_audioPlayer.play());
  }

  void resetEffect() {
    state = state.copyWith(error: null);
  }
}
