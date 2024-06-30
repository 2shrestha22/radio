import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:radio/provider/radio_state.dart';
import 'package:radio/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'radio.g.dart';

@riverpod
class Radio extends _$Radio {
  @override
  RadioState build() {
    _listenUpdates();
    return const RadioState();
  }

  late final _audioPlayer = AudioPlayer();

  // Internal variables
  /// After error setting url this field is true. Then when trying to play
  /// radio again we need to reset the url to foucused station.
  bool _needUrlReset = false;

  /// Focus a station and start playing.
  Future<void> setFocusedStation(RadioStation station) async {
    state = state.copyWith(station: station);

    try {
      await _audioPlayer.stop();
      await _audioPlayer.setUrl(station.url);
      await _audioPlayer.play();
      _needUrlReset = false;
    } on PlayerException catch (e) {
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
      await _audioPlayer.play();
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
        state = state.copyWith(
          processingState: event.processingState,
          isPlaying: event.playing,
        );
      },
    );

    _audioPlayer.icyMetadataStream.listen(
      (event) {
        state = state.copyWith(
          bitRate: event?.headers?.bitrate,
          title: event?.info?.title,
        );
      },
    );
  }

  void resetEffect() {
    state = state.copyWith(error: null);
  }
}
