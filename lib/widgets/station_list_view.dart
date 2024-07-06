import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/widgets/station_logo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    return SliverList.separated(
      separatorBuilder: (context, index) => const Gutter(),
      itemCount: stations.length,
      itemBuilder: (context, index) {
        final theme = ShadTheme.of(context);
        final station = stations.elementAt(index);
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: theme.cardTheme.backgroundColor ?? theme.colorScheme.card,
            borderRadius: theme.cardTheme.radius ?? theme.radius,
            border: theme.cardTheme.border ??
                Border.all(color: theme.colorScheme.border),
            boxShadow: theme.cardTheme.shadows,
          ),
          child: Row(
            children: [
              StationLogo(station.logo),
              const GutterTiny(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      station.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.large,
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
              ShadButton.secondary(
                applyIconColorFilter: false,
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
              ShadButton.secondary(
                onPressed: () => onTap(station),
                icon: const Icon(
                  LucideIcons.play,
                  key: ValueKey('false'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
