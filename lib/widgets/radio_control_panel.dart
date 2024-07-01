import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio/const.dart';
import 'package:radio/loader.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/utils/bitrate.dart';
import 'package:radio/widgets/station_logo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RadioControlPanel extends ConsumerWidget {
  const RadioControlPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioState = ref.watch(radioProvider);
    return ShadCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              StationLogo(radioState.station!.logo),
              DefaultTextStyle(
                style: ShadTheme.of(context).textTheme.small,
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
          Expanded(
            child: Column(
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
                  style: ShadTheme.of(context).textTheme.small,
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
                    child: radioState.processingState == ProcessingState.loading
                        ? const Loader()
                        : ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              const ShadButton.outline(
                                size: ShadButtonSize.icon,
                                icon: Icon(LucideIcons.skipBack),
                              ),
                              Builder(
                                builder: (context) {
                                  return ShadButton.outline(
                                    size: ShadButtonSize.icon,
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
                              const ShadButton.outline(
                                size: ShadButtonSize.icon,
                                icon: Icon(LucideIcons.skipForward),
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
