import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio/pages/home/widgets/remove_fav_dialog.dart';
import 'package:radio/pages/home/widgets/station_list_view.dart';
import 'package:radio/provider/favorite_stations.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Consumer(
          builder: (context, ref, child) {
            return StationListView(
              stations: ref.watch(favoriteStationsProvider),
              onTap: (station) async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                return ref
                    .read(radioProvider.notifier)
                    .setFocusedStation(station);
              },
              onFavTap: (station) async {
                final shouldRemove = await showDialog<bool?>(
                  context: context,
                  builder: (context) => RemoveFavDialog(station: station),
                );

                if (shouldRemove ?? false) {
                  ref.read(stationsProvider.notifier).toggleFav(station.id);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
