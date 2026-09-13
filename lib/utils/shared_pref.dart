import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  const SharedPref._();

  static late final SharedPreferences _sharedPref;

  static const _favKey = 'fav';
  static const _frecencyKey = 'frecency';

  static List<String> get fav => _sharedPref.getStringList(_favKey) ?? [];

  static Map<String, double> get frecencyScores {
    final raw = _sharedPref.getString(_frecencyKey);
    if (raw == null) return {};
    return (jsonDecode(raw) as Map<String, dynamic>)
        .map((k, v) => MapEntry(k, (v as num).toDouble()));
  }

  static Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();

    if (_sharedPref.getStringList(_favKey)?.isEmpty ?? true) {
      await updateFavorite([
        "Y_OOEauq-U3AB9GcRyuee",
        "PpdCGSEQ44Ox4uLzlgcin",
        "63DAluhRgl-PcYeixk5eY",
      ]);
    }
  }

  static Future<void> updateFavorite(List<String> ids) async {
    _sharedPref.setStringList(_favKey, ids);
  }

  static Future<void> bumpFrecency(String stationId) async {
    final scores = frecencyScores;
    scores[stationId] = (scores[stationId] ?? 0) * 0.5 + 1.0;
    await _sharedPref.setString(_frecencyKey, jsonEncode(scores));
  }
}
