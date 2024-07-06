import 'package:radio/provider/stations.dart';
import 'package:radio/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_stations.g.dart';

@riverpod
class FavoriteStations extends _$FavoriteStations {
  @override
  List<RadioStation> build() {
    final stations =
        ref.watch(stationsProvider).where((element) => element.fav).toList();

    return stations;
  }
}
