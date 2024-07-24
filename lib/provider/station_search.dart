import 'package:fuzzy/fuzzy.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/search_input.dart';
import 'package:radio/provider/stations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'station_search.g.dart';

@riverpod
class StationSearch extends _$StationSearch {
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
    final searchInput = ref.watch(searchInputProvider);

    return Fuzzy<RadioStation>(
      ref.watch(stationsProvider),
      options: _fuzzyOptions,
    ).search(searchInput).map((e) => e.item).toList();
  }
}
