import 'package:radio/models/province.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/stations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'province_controller.g.dart';

@riverpod
class ProvinceController extends _$ProvinceController {
  @override
  List<Province> build() {
    final stations = ref.watch(stationsProvider);

    final List<RadioStation> koshi = [];
    final List<RadioStation> madhesh = [];
    final List<RadioStation> bagmati = [];
    final List<RadioStation> gandaki = [];
    final List<RadioStation> lumbini = [];
    final List<RadioStation> karnali = [];
    final List<RadioStation> sudurpaschim = [];
    final List<RadioStation> others = [];

    for (var station in stations) {
      switch (station.province) {
        case 1:
          koshi.add(station);
          break;
        case 2:
          madhesh.add(station);
          break;
        case 3:
          bagmati.add(station);
          break;
        case 4:
          gandaki.add(station);
          break;
        case 5:
          lumbini.add(station);
          break;
        case 6:
          karnali.add(station);
          break;
        case 7:
          sudurpaschim.add(station);
          break;
        default:
          others.add(station);
          break;
      }
    }

    return [
      KoshiProvince(stations: koshi),
      MadheshProvince(stations: madhesh),
      BagmatiProvince(stations: bagmati),
      GandakiProvince(stations: gandaki),
      LumbiniProvince(stations: lumbini),
      KarnaliProvince(stations: karnali),
      SudurpaschimProvince(stations: sudurpaschim),
      UnknownProvince(stations: others),
    ];
  }
}
