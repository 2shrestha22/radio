import 'dart:async';
import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/provider/radio_state.dart';
import 'package:radio/radio_station.dart';
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

  /// Focus a station and start playing.
  Future<void> setFocusedStation(RadioStation station) async {
    if (state.station == station && _audioPlayer.playing && !_needUrlReset) {
      return;
    }

    state = state.copyWith(station: station);

    try {
      if (_audioPlayer.playing) {
        await _audioPlayer.stop();
      }
      await _audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(station.streamUrl),
          tag: MediaItem(
            id: station.id,
            title: station.name,
            duration: Duration.zero,
            artUri: Uri.tryParse(station.imageUrl),
          ),
        ),
      );
      unawaited(_audioPlayer.play());
      _needUrlReset = false;
    } on PlayerInterruptedException catch (e) {
      log(e.toString());
    } catch (e) {
      _needUrlReset = true;
      state = state.copyWith(error: e);
    }
  }

  /// Play focused station.
  Future<void> play() async {
    if (_needUrlReset) {
      // resetting stream url.
      await setFocusedStation(state.station!);
    } else {
      unawaited(_audioPlayer.play());
    }
  }

  // Pause focused station.
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() => _audioPlayer.stop();

  void _listenUpdates() {
    _audioPlayer.playerStateStream.listen(
      (event) {
        StreamingState? getStreamingState() {
          if (event.playing && event.processingState == ProcessingState.ready) {
            return StreamingState.playing;
          }
          if (event.processingState == ProcessingState.buffering ||
              event.processingState == ProcessingState.loading) {
            return StreamingState.buffering;
          }
          return null;
        }

        RadioPlayerState getPlayerState() {
          if (!event.playing && event.processingState == ProcessingState.idle) {
            return RadioPlayerState.stopped;
          }

          if (!event.playing &&
              event.processingState == ProcessingState.ready) {
            return RadioPlayerState.paused;
          }

          return RadioPlayerState.started;
        }

        state = state.copyWith(
          playerState: getPlayerState(),
          streamingState: getStreamingState(),
        );
      },
    ).addTo(_subscription);

    _audioPlayer.icyMetadataStream.listen(
      (event) {
        state = state.copyWith(
          bitRate: event?.headers?.bitrate,
          title: event?.info?.title,
        );
      },
    ).addTo(_subscription);
  }

  void resetEffect() {
    state = state.copyWith(error: null);
  }
}
