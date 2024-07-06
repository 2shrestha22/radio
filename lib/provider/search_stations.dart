import 'package:fuzzy/fuzzy.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_stations.g.dart';

@riverpod
class SearchStations extends _$SearchStations {
  var _searchText = '';

  final _fuzzyOptions = FuzzyOptions<RadioStation>(
    keys: [
      WeightedKey(
        name: 'name',
        getter: (obj) => obj.name,
        weight: 0.6,
      ),
      WeightedKey(
        name: 'frequency',
        getter: (obj) => obj.frequency?.toString() ?? '',
        weight: 0.3,
      ),
      WeightedKey(
        name: 'address',
        getter: (obj) => obj.address ?? '',
        weight: 0.1,
      ),
    ],
  );

  @override
  List<RadioStation> build() {
    return Fuzzy<RadioStation>(
      ref.watch(stationsProvider),
      options: _fuzzyOptions,
    ).search(_searchText).map((e) => e.item).toList();
  }

  void search(String pattern) {
    _searchText = pattern.trim();
    ref.invalidateSelf();
  }
}
