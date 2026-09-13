import 'package:radio/models/province.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/stations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_controller.g.dart';

const _provinceNames = {
  1: 'Koshi',
  2: 'Madhesh',
  3: 'Bagmati',
  4: 'Gandaki',
  5: 'Lumbini',
  6: 'Karnali',
  7: 'Sudurpaschim',
};

@riverpod
class ProvinceController extends _$ProvinceController {
  @override
  List<Province> build() {
    final stations = ref.watch(stationsProvider);
    final grouped = <int, List<RadioStation>>{};

    for (final station in stations) {
      final key = station.province ?? -1;
      (grouped[key] ??= []).add(station);
    }

    return [
      for (final id in [1, 2, 3, 4, 5, 6, 7])
        if (grouped.containsKey(id))
          Province(id: id, name: _provinceNames[id]!, stations: grouped[id]!),
      if (grouped.containsKey(-1))
        Province(id: -1, name: 'Others', stations: grouped[-1]!),
    ];
  }
}
