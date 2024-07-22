import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_station.freezed.dart';
part 'radio_station.g.dart';

@freezed
class RadioStation with _$RadioStation {
  const RadioStation._();

  const factory RadioStation({
    required String id,
    required String name,
    required String streamUrl,
    required double? frequency,
    required String? address,
    @Default(false) bool fav,
  }) = _RadioStation;

  String get imageUrl =>
      'https://cdn.jsdelivr.net/gh/2shrestha22/radio/assets/logo/$id.jpg';

  factory RadioStation.fromJson(Map<String, dynamic> json) =>
      _$RadioStationFromJson(json);

  String getFreqString() {
    if (frequency == null) return 'Online Radio';
    // 90.0 -> 90
    // 91.8 -> 92.8
    final freq = frequency! % 1 == 0 ? frequency!.toInt() : frequency;

    return '$freq MHz';
  }
}

List<RadioStation> allRadioStations = [];
