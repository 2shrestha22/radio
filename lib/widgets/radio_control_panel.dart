import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/const.dart';
import 'package:radio/loader.dart';
import 'package:radio/provider/radio.dart';
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
          Column(
            children: [
              StationLogo(radioState.station!.imageUrl),
              const GutterTiny(),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.bodySmall!,
                child: Builder(
                  builder: (context) {
                    if (radioState.isPlaying && radioState.bitRate != null) {
                      return Text(formatBitrate(radioState.bitRate!));
                    }
                    return const Text('-- Kbps');
                  },
                ),
              ),
            ],
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
                  child: Builder(
                    builder: (context) {
                      if (radioState.isPlaying && radioState.title != null) {
                        return Text(
                          radioState.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: AnimatedSwitcher(
                    duration: animationDuration,
                    child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        radioState.processingState == ProcessingState.loading
                            ? const SizedBox.square(
                                dimension: 48,
                                child: Loader(),
                              )
                            : Builder(
                                builder: (context) {
                                  return IconButton(
                                    icon: AnimatedSwitcher(
                                      duration: animationDuration,
                                      child: switch (radioState.isPlaying) {
                                        true => const Icon(
                                            key: Key('pause'),
                                            LucideIcons.pause),
                                        false => const Icon(
                                            key: Key('play'),
                                            LucideIcons.play,
                                          ),
                                      },
                                    ),
                                    onPressed: () async {
                                      if (radioState.isPlaying) {
                                        await ref
                                            .read(radioProvider.notifier)
                                            .pause();
                                      } else {
                                        await ref
                                            .read(radioProvider.notifier)
                                            .play();
                                      }
                                    },
                                  );
                                },
                              ),
                        AnimatedOpacity(
                          duration: animationDuration,
                          opacity:
                              radioState.processingState == ProcessingState.idle
                                  ? 0
                                  : 1,
                          child: IconButton(
                            icon: const Icon(LucideIcons.square),
                            onPressed: () async {
                              await ref.read(radioProvider.notifier).stop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
