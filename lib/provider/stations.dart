import 'dart:async';

import 'package:radio/shared_pref.dart';
import 'package:radio/radio_station.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stations.g.dart';

@riverpod
class Stations extends _$Stations {
  @override
  List<RadioStation> build() {
    final favIds = SharedPref.fav;
    return [
      for (final station in allRadioStations)
        if (favIds.contains(station.id))
          station.copyWith(fav: true)
        else
          station
    ];
  }

  /// toggle favorite
  Future<void> toggleFav(String id) async {
    // update state
    state = [
      for (final station in state)
        if (station.id == id) station.copyWith(fav: !station.fav) else station,
    ];

    // update saved favs
    final favStationIds =
        state.where((element) => element.fav).map((e) => e.id);
    await SharedPref.updateFavorite(favStationIds.toList());
  }
}
