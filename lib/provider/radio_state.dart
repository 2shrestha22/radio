import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio/radio_station.dart';
part 'radio_state.freezed.dart';

@freezed
class RadioState with _$RadioState {
  const factory RadioState({
    RadioStation? station,
    @Default(ProcessingState.idle) ProcessingState processingState,
    @Default(false) bool isPlaying,
    String? title,
    int? bitRate,
    Object? error,
  }) = _RadioState;
}
