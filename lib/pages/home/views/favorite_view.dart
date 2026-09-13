import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/pages/home/widgets/remove_fav_dialog.dart';
import 'package:radio/pages/home/widgets/station_list_view.dart';
import 'package:radio/provider/frequently_played.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/widgets/station_logo.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Consumer(
          builder: (context, ref, child) {
            final frequent = ref.watch(frequentlyPlayedProvider);
            if (frequent.isEmpty) return const SliverToBoxAdapter();
            return SliverToBoxAdapter(
              child: _FrequentlyPlayedRow(
                stations: frequent,
                onTap: (station) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ref.read(radioProvider.notifier).setFocusedStation(station);
                },
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return StationListView(
              stations: ref.watch(stationsProvider).where((e) => e.fav).toList(),
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

class _FrequentlyPlayedRow extends StatelessWidget {
  const _FrequentlyPlayedRow({required this.stations, required this.onTap});
  final List<RadioStation> stations;
  final void Function(RadioStation) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: stations.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final station = stations[index];
              return GestureDetector(
                onTap: () => onTap(station),
                child: SizedBox(
                  width: 70,
                  child: Column(
                    children: [
                      StationLogo(station.imageUrl),
                      const SizedBox(height: 4),
                      Text(
                        station.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(height: 0, indent: 16, endIndent: 16),
      ],
    );
  }
}
