import 'dart:convert';

import 'package:flutter/services.dart';

class RadioStation {
  final String name;
  final String frequency;
  final String url;
  final String logo;

  RadioStation({
    required this.name,
    required this.frequency,
    required this.url,
    required this.logo,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'frequency': frequency});
    result.addAll({'url': url});
    result.addAll({'logo': logo});

    return result;
  }

  factory RadioStation.fromMap(Map<String, dynamic> map) {
    return RadioStation(
      name: map['name'] ?? '',
      frequency: map['frequency'] ?? '',
      url: map['url'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RadioStation.fromJson(String source) =>
      RadioStation.fromMap(json.decode(source));
}

List<RadioStation> radioStations = [];
Future<void> loadStations() async {
  final data = await rootBundle.loadString("assets/radio_stations.json");
  radioStations =
      (jsonDecode(data) as List).map((e) => RadioStation.fromMap(e)).toList();
}
