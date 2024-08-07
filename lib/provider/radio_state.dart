import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/radio_station.dart';

part 'radio_state.freezed.dart';

@freezed
class RadioState with _$RadioState {
  const factory RadioState({
    RadioStation? station,
    @Default(RadioPlayerState.idle) RadioPlayerState playerState,

    /// It will be null if [playerState] is not started or paused.
    StreamingState? streamingState,
    String? title,
    int? bitRate,
    Object? error,
  }) = _RadioState;
}
