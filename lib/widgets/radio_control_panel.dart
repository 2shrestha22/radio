import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/const.dart';
import 'package:radio/loader.dart';
import 'package:radio/provider/player_state.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/utils/bitrate.dart';
import 'package:radio/widgets/station_logo.dart';

class RadioControlPanel extends ConsumerWidget {
  const RadioControlPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioState = ref.watch(radioProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodySmall!,
            child: Column(
              children: [
                StationLogo(radioState.station!.imageUrl),
                const GutterTiny(),
                Builder(
                  builder: (context) {
                    if (radioState.bitRate != null) {
                      return Text(formatBitrate(radioState.bitRate!));
                    }
                    return const Text('-- Kbps');
                  },
                ),
              ],
            ),
          ),
          const Gutter(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  radioState.station!.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodySmall!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(radioState.station!.getFreqString()),
                      Flexible(
                        child: Builder(
                          builder: (context) {
                            if (radioState.title != null) {
                              return Text(
                                ' | ${radioState.title!}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: animationDuration,
                      // transitionBuilder fixes
                      // https://github.com/flutter/flutter/issues/121336
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: switch (radioState.streamingState) {
                        StreamingState.buffering => IconButton(
                            key: const ValueKey('loader-icon'),
                            icon: const Loader(),
                            disabledColor: Theme.of(context).iconTheme.color,
                            onPressed: null,
                          ),
                        StreamingState.playing => IconButton(
                            key: const ValueKey('pause-button'),
                            onPressed: () async {
                              await ref.read(radioProvider.notifier).pause();
                            },
                            icon: const Icon(LucideIcons.pause),
                          ),
                        null => IconButton(
                            key: const ValueKey('play-button'),
                            onPressed: () async {
                              await ref.read(radioProvider.notifier).play();
                            },
                            icon: const Icon(LucideIcons.play),
                          )
                      },
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.square),
                      onPressed: radioState.playerState.isRunning
                          ? () async {
                              await ref.read(radioProvider.notifier).stop();
                            }
                          : null,
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
                                .firstWhere(
                                  (e) => e.id == radioState.station!.id,
                                )
                                .fav) {
                              true => const Icon(
                                  Icons.favorite,
                                  key: ValueKey('true'),
                                  color: Colors.red,
                                ),
                              false => const Icon(Icons.favorite_outline),
                            },
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
