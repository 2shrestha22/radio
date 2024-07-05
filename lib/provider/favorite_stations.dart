import 'package:radio/provider/shared_pref.dart';
import 'package:radio/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_stations.g.dart';

@riverpod
class FavoriteStations extends _$FavoriteStations {
  final _favIds = SharedPref.fav;
  @override
  List<RadioStation> build() {
    final stations = allRadioStations
        .where((element) => _favIds.contains(element.id))
        .toList();

    return stations;
  }
}
