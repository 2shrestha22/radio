import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/widgets/playing_indicator.dart';
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
    final radioState = ref.watch(radioProvider);
    final activeStationId = radioState.station?.id;
    final isPlaying = radioState.streamingState == StreamingState.playing;

    if (widget.stations.isEmpty) {
      return SliverFillRemaining(child: HugeIcon(icon: HugeIcons.strokeRoundedCircle, size: 8));
    }
    return SliverList.separated(
        separatorBuilder: (context, index) => const Divider(height: 0, indent: 8, endIndent: 8),
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
                    SizedBox(width: 4),
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
                          Row(
                            children: [
                              Text(
                                station.getFreqString(),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (isActive && isPlaying)
                                const Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: PlayingIndicator(size: 12, color: Colors.red),
                                ),
                            ],
                          ),
                          Text(
                            station.address ?? '--',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    IconButton(
                      onPressed: () => widget.onFavTap(station),
                      icon: switch (station.fav) {
                        true => HugeIcon(
                          icon: HugeIcons.strokeRoundedFavourite,
                          key: const ValueKey('true'),
                          color: Colors.red,
                        ),
                        false => HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
