import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/widgets/station_logo.dart';

class StationSearchDelegate extends SearchDelegate<RadioStation?> {
  StationSearchDelegate(this.ref);
  final WidgetRef ref;

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
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    final results = _search(query);
    if (query.isEmpty) {
      return const SizedBox.shrink();
    }
    if (results.isEmpty) {
      return const Center(child: Text('No stations found'));
    }
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, _) => const Divider(height: 0),
      itemBuilder: (context, index) {
        final station = results[index];
        return ListTile(
          leading: StationLogo(station.imageUrl),
          title: Text(
            station.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(station.getFreqString()),
          onTap: () {
            ref.read(radioProvider.notifier).setFocusedStation(station);
            close(context, station);
          },
        );
      },
    );
  }
}
