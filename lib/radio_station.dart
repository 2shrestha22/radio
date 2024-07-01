import 'dart:convert';

import 'package:flutter/services.dart';

class RadioStation {
  final String id;
  final String name;
  final double? frequency;
  final String? address;
  final String url;
  final String? logo;
  final int? province;

  RadioStation({
    required this.id,
    required this.name,
    required this.frequency,
    required this.address,
    required this.url,
    required this.logo,
    required this.province,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (frequency != null) {
      result.addAll({'freq': frequency});
    }
    if (address != null) {
      result.addAll({'addr': address});
    }
    result.addAll({'url': url});
    if (logo != null) {
      result.addAll({'logo': logo});
    }
    if (province != null) {
      result.addAll({'province': province});
    }

    return result;
  }

  factory RadioStation.fromMap(Map<String, dynamic> map) {
    return RadioStation(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      frequency: map['freq']?.toDouble(),
      address: map['addr'],
      url: map['url'] ?? '',
      logo: map['logo'],
      province: map['province']?.toInt(),
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
