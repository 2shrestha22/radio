import 'dart:async';

// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
import 'package:audioplayers/audioplayers.dart';
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

    _listenUpdates();
    return const RadioState();
  }

  /// Focus a station and start playing.
  Future<void> setFocusedStation(RadioStation station) async {
    if (state.station == station && _audioPlayer.state == PlayerState.playing) {
      return;
    }
    state = state.copyWith(station: station);
    try {
      // not resuming instead playing live stream
      await _audioPlayer.play(UrlSource(station.streamUrl));
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  /// Play focused station.
  Future<void> play() async {
    await _audioPlayer.resume();
  }

  // Pause focused station.
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() => _audioPlayer.stop();

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
        }

        if (event == PlayerState.paused) {
          state = state.copyWith(
            playerState: RadioPlayerState.paused,
            streamingState: null,
          );
        }

        if (event == PlayerState.stopped) {
          state = state.copyWith(
            playerState: RadioPlayerState.stopped,
            streamingState: null,
          );
        }
      },
    ).addTo(_subscription);

    _audioPlayer.eventStream.listen(
      (event) {
        print(event);
      },
    );

    // _audioPlayer.playerStateStream.listen(
    //   (event) {
    //     StreamingState? getStreamingState() {
    //       if (event.playing && event.processingState == ProcessingState.ready) {
    //         return StreamingState.playing;
    //       }
    //       if (event.processingState == ProcessingState.buffering ||
    //           event.processingState == ProcessingState.loading) {
    //         return StreamingState.buffering;
    //       }
    //       return null;
    //     }

    //     RadioPlayerState getPlayerState() {
    //       if (!event.playing && event.processingState == ProcessingState.idle) {
    //         return RadioPlayerState.stopped;
    //       }

    //       if (!event.playing &&
    //           event.processingState == ProcessingState.ready) {
    //         return RadioPlayerState.paused;
    //       }

    //       return RadioPlayerState.started;
    //     }

    //     state = state.copyWith(
    //       playerState: getPlayerState(),
    //       streamingState: getStreamingState(),
    //     );
    //   },
    // ).addTo(_subscription);

    // _audioPlayer.icyMetadataStream.listen(
    //   (event) {
    //     state = state.copyWith(
    //       bitRate: event?.headers?.bitrate,
    //       title: event?.info?.title,
    //     );
    //   },
    // ).addTo(_subscription);
  }

  void resetEffect() {
    state = state.copyWith(error: null);
  }
}
