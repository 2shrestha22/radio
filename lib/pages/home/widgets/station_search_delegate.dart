import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/frequently_played.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/widgets/station_logo.dart';

class StationSearchDelegate extends SearchDelegate<RadioStation?> {
  StationSearchDelegate(this.ref);
  final WidgetRef ref;

  void _playAndClose(BuildContext context, RadioStation station) {
    ref.read(radioProvider.notifier).setFocusedStation(station);
    close(context, station);
  }

  Widget _buildStationTile(BuildContext context, RadioStation station) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => _playAndClose(context, station),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            StationLogo(station.imageUrl),
            const GutterTiny(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    station.getFreqString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    station.address ?? '--',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const GutterTiny(),
            Consumer(
              builder: (context, ref, _) {
                final isFav = ref.watch(
                  stationsProvider.select(
                    (stations) => stations.firstWhere((s) => s.id == station.id).fav,
                  ),
                );
                return IconButton(
                  onPressed: () =>
                      ref.read(stationsProvider.notifier).toggleFav(station.id),
                  icon: switch (isFav) {
                    true => HugeIcon(
                      icon: HugeIcons.strokeRoundedFavourite,
                      color: Colors.red,
                    ),
                    false => HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrequentlyPlayed(BuildContext context) {
    final frequent = ref.read(frequentlyPlayedProvider);
    if (frequent.isEmpty) {
      return Center(
        child: Text(
          'Search for a station',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    return ListView.separated(
      itemCount: frequent.length,
      separatorBuilder: (_, _) => const Divider(height: 0, indent: 8, endIndent: 8),
      itemBuilder: (context, index) =>
          _buildStationTile(context, frequent[index]),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  List<RadioStation> _search(String query) {
    if (query.isEmpty) return [];
    final stations = ref.read(stationsProvider);
    final fuse = Fuzzy<RadioStation>(
      stations,
      options: FuzzyOptions(
        keys: [
          WeightedKey(name: 'name', getter: (obj) => obj.name, weight: 0.6),
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
      ),
    );
    return fuse.search(query).map((e) => e.item).toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedCancel01),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return _buildFrequentlyPlayed(context);
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    final results = _search(query);
    if (results.isEmpty) {
      return Center(
        child: Text(
          'No stations found',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, _) => const Divider(height: 0, indent: 8, endIndent: 8),
      itemBuilder: (context, index) =>
          _buildStationTile(context, results[index]),
    );
  }
}
