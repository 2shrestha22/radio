import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/utils/shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'frequently_played.g.dart';

@riverpod
class FrequentlyPlayed extends _$FrequentlyPlayed {
  @override
  List<RadioStation> build() {
    return _getFrequentlyPlayed();
  }

  List<RadioStation> _getFrequentlyPlayed() {
    final scores = SharedPref.frecencyScores;
    if (scores.isEmpty) return [];

    final stations = ref.read(stationsProvider);
    final stationMap = {for (final s in stations) s.id: s};

    final sorted = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sorted
        .where((e) => stationMap.containsKey(e.key) && e.value > 0.1 && !stationMap[e.key]!.fav)
        .take(10)
        .map((e) => stationMap[e.key]!)
        .toList();
  }

  Future<void> recordPlay(String stationId) async {
    await SharedPref.bumpFrecency(stationId);
  }
}
