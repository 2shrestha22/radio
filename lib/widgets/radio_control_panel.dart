import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/utils/bitrate.dart';
import 'package:radio/utils/const.dart';
import 'package:radio/widgets/loader.dart';
import 'package:radio/widgets/playing_indicator.dart';
import 'package:radio/widgets/station_logo.dart';

class RadioControlPanel extends ConsumerWidget {
  const RadioControlPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioState = ref.watch(radioProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          StationLogo(radioState.station!.imageUrl),
          const Gutter(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  radioState.station!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  radioState.bitRate != null
                      ? '${radioState.station!.getFreqString()} · ${formatBitrate(radioState.bitRate!)}'
                      : radioState.station!.getFreqString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  children: [
                    if (radioState.streamingState == StreamingState.playing)
                      const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: PlayingIndicator(size: 12, color: Colors.red),
                      ),
                    Expanded(
                      child: Text(
                        radioState.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: animationDuration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: switch (radioState.streamingState) {
              StreamingState.buffering => IconButton(
                key: const ValueKey('loader-icon'),
                icon: const Loader(),
                disabledColor: Theme.of(context).iconTheme.color,
                onPressed: null,
              ),
              StreamingState.playing => IconButton(
                key: const ValueKey('stop-button'),
                onPressed: () async {
                  await ref.read(radioProvider.notifier).stop();
                },
                icon: HugeIcon(icon: HugeIcons.strokeRoundedStop),
              ),
              null => IconButton(
                key: const ValueKey('play-button'),
                onPressed: () async {
                  await ref.read(radioProvider.notifier).play();
                },
                icon: HugeIcon(icon: HugeIcons.strokeRoundedPlay),
              ),
            },
          ),
          if (radioState.station != null)
            Consumer(
              builder: (context, ref, child) {
                final station = ref.watch(stationsProvider);
                return IconButton(
                  onPressed: () => ref
                      .read(stationsProvider.notifier)
                      .toggleFav(radioState.station!.id),
                  icon: switch (station
                      .firstWhere((e) => e.id == radioState.station!.id)
                      .fav) {
                    true => HugeIcon(
                      icon: HugeIcons.strokeRoundedFavourite,
                      key: const ValueKey('true'),
                      color: Colors.red,
                    ),
                    false => HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
