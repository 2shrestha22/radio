import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/widgets/station_logo.dart';

class StationListView extends ConsumerStatefulWidget {
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
  ConsumerState<StationListView> createState() => _StationListViewState();
}

class _StationListViewState extends ConsumerState<StationListView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final activeStationId = ref.watch(
      radioProvider.select((s) => s.station?.id),
    );

    if (widget.stations.isEmpty) {
      return const SliverFillRemaining(
        child: Icon(LucideIcons.dot),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: widget.stations.length,
        itemBuilder: (context, index) {
          final theme = Theme.of(context);
          final station = widget.stations.elementAt(index);
          final isActive = station.id == activeStationId;
          return InkWell(
            onTap: () => widget.onTap(station),
            child: ColoredBox(
              color: isActive
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.4)
                  : Colors.transparent,
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
                            style: theme.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
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
                      onPressed: () => widget.onFavTap(station),
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
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
