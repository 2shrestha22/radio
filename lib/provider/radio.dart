import 'dart:async';
import 'dart:io';

// import 'package:just_audio_background/just_audio_background.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/provider/radio_state.dart';
import 'package:radio/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'radio.g.dart';

@riverpod
class Radio extends _$Radio {
  final _subscription = CompositeSubscription();

  final _audioPlayer = AudioPlayer();

  @override
  RadioState build() {
    ref.onDispose(() {
      _subscription.dispose();
      _audioPlayer.dispose();
    });

    if (kDebugMode) {
      AudioLogger.logLevel = AudioLogLevel.info;
    }
    _audioPlayer.positionUpdater = TimerPositionUpdater(
      interval: const Duration(milliseconds: 100),
      getPosition: _audioPlayer.getCurrentPosition,
    );
    _listenUpdates();
    return const RadioState();
  }

  /// Focus a station and start playing.
  Future<void> setFocusedStation(RadioStation station) async {
    if (state.station == station && _audioPlayer.state == PlayerState.playing) {
      return;
    }
    state = state.copyWith(
      station: station,
      streamingState: StreamingState.buffering,
    );
    try {
      // not resuming instead playing live stream
      await _audioPlayer.play(UrlSource(station.streamUrl));
    } catch (e) {
      state = state.copyWith(error: e);
      await _audioPlayer.release();
    }
  }

  /// Play focused station.
  Future<void> play() async {
    state = state.copyWith(streamingState: StreamingState.buffering);

    if (Platform.isAndroid && state.station != null) {
      await _audioPlayer.play(UrlSource(state.station!.streamUrl));
    }
    await _audioPlayer.resume();
  }

  // Pause focused station.
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  // release all resource when stopping
  Future<void> stop() => _audioPlayer.release();

  void _listenUpdates() {
    _audioPlayer.onPlayerStateChanged.listen(
      (event) {
        if (event == PlayerState.playing) {
          state = state.copyWith(
            playerState: RadioPlayerState.started,
            streamingState: event == PlayerState.playing
                ? StreamingState.playing
                : state.streamingState,
          );
          return;
        }

        if (event == PlayerState.paused) {
          state = state.copyWith(
            playerState: RadioPlayerState.paused,
            streamingState: null,
          );
          return;
        }

        if (event == PlayerState.stopped) {
          state = state.copyWith(
            playerState: RadioPlayerState.stopped,
            streamingState: null,
          );
          return;
        }
        state = state.copyWith(streamingState: null);
      },
    ).addTo(_subscription);

    // listens if player position is updating or not.
    _audioPlayer.onPositionChanged
        .map((_) => true) // Map to true indicating position is updating
        .mergeWith([
          // Emits false if position hasn't changed for more than 1 second
          _audioPlayer.onPositionChanged
              .debounceTime(const Duration(milliseconds: 150))
              .map((_) => false)
        ])
        .map((event) {
          if (_audioPlayer.state == PlayerState.playing) {
            return event ? StreamingState.playing : StreamingState.buffering;
          } else {
            return null;
          }
        })
        .distinct()
        .listen(
          (event) {
            state = state.copyWith(streamingState: event);
          },
        )
        .addTo(_subscription);
  }

  void resetEffect() {
    state = state.copyWith(error: null);
  }
}
