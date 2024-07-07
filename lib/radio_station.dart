// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:flutter/services.dart';
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

  String? get logoPath => 'assets/logo/$id';

  factory RadioStation.fromJson(Map<String, dynamic> json) =>
      _$RadioStationFromJson(json);

  String getFreqString() =>
      frequency != null ? '$frequency MHz' : 'Online Radio';
}

List<RadioStation> allRadioStations = [];

Future<void> loadStations() async {
  final data = await rootBundle.loadString("assets/radio_list.json");
  allRadioStations =
      (jsonDecode(data) as List).map((e) => RadioStation.fromJson(e)).toList();
}
