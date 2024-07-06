import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/widgets/station_logo.dart';

class StationListView extends StatelessWidget {
  const StationListView({
    super.key,
    required this.onTap,
    required this.stations,
    required this.onFavTap,
  });

  final void Function(RadioStation station) onTap;
  final void Function(RadioStation station) onFavTap;
  final List<RadioStation> stations;

  @override
  Widget build(BuildContext context) {
    if (stations.isEmpty) {
      return const SliverFillRemaining(
        child: Icon(LucideIcons.dot),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final theme = Theme.of(context);
          final station = stations.elementAt(index);
          return InkWell(
            onTap: () => onTap(station),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  StationLogo(station.logoPath),
                  const GutterTiny(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge,
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
                  IconButton(
                    onPressed: () => onFavTap(station),
                    icon: switch (station.fav) {
                      true => const Icon(
                          Icons.favorite,
                          key: ValueKey('true'),
                          color: Colors.red,
                        ),
                      false => const Icon(Icons.favorite_outline),
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
