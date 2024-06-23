import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio/const.dart';
import 'package:radio/loader.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/utils/bitrate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final audioPlayer = AudioPlayer();

  // Station to be played or stopped.
  RadioStation? focusedStation;
  Object? error;
  bool shouldResetUrl = false;
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio')),
      bottomNavigationBar: AnimatedSwitcher(
        duration: animationDuration,
        child: focusedStation == null
            ? const SizedBox.shrink()
            : ShadCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        _ImageWidget(focusedStation!.logo),
                        DefaultTextStyle(
                          style: ShadTheme.of(context).textTheme.small,
                          child: StreamBuilder(
                            stream: audioPlayer.icyMetadataStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final bitrate = snapshot.data!.headers?.bitrate;

                                if (bitrate == null) {
                                  return const Text('-- Kbps');
                                }
                                return Text(formatBitrate(bitrate));
                              }
                              return const Text('');
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
                            focusedStation!.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          DefaultTextStyle(
                            style: ShadTheme.of(context).textTheme.small,
                            child: StreamBuilder(
                              stream: audioPlayer.icyMetadataStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final metadata = snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(metadata.info?.title ?? ''),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            child: StreamBuilder<PlayerState>(
                              stream: audioPlayer.playerStateStream,
                              builder: (context, snapshot) {
                                final loading = snapshot.data == null ||
                                    snapshot.data?.processingState ==
                                        ProcessingState.loading;

                                return AnimatedSwitcher(
                                  duration: animationDuration,
                                  child: loading
                                      ? const Loader()
                                      : _buttonBar(snapshot),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 8),
              child: ShadInput(
                controller: textEditingController,
                placeholder: const Text('Search'),
                decoration: const ShadDecoration(
                  secondaryFocusedBorder: ShadBorder.none,
                  secondaryBorder: ShadBorder.none,
                ),
                suffix: ShadButton.ghost(
                  width: 24,
                  height: 24,
                  foregroundColor: ShadTheme.of(context).colorScheme.border,
                  padding: EdgeInsets.zero,
                  decoration: const ShadDecoration(
                    secondaryBorder: ShadBorder.none,
                    secondaryFocusedBorder: ShadBorder.none,
                  ),
                  icon: const Icon(
                    LucideIcons.x,
                  ),
                  onPressed: () {
                    textEditingController.clear();
                  },
                ),
              ),
            ),
            backgroundColor: ShadTheme.of(context).colorScheme.card,
            surfaceTintColor: Colors.transparent,
          ),
          SliverList.separated(
            separatorBuilder: (context, index) => const Gutter(),
            itemCount: radioStations.length,
            itemBuilder: (context, index) {
              final station = radioStations.elementAt(index);
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    focusedStation = station;
                  });
                  try {
                    await audioPlayer.stop();
                    await audioPlayer.setUrl(station.url);
                    await audioPlayer.play();
                    shouldResetUrl = false;
                  } catch (e) {
                    setState(() {
                      shouldResetUrl = true;
                      error = e;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ShadCard(
                    padding: const EdgeInsets.all(12),
                    trailing: _ImageWidget(station.logo),
                    title: Text(
                      station.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    content: station.frequency != null
                        ? Text('${station.frequency} MHz',
                            style: const TextStyle(fontWeight: FontWeight.bold))
                        : const Text(
                            'Online Radio',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                    footer: Text(
                      station.address ?? '--',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          ),
          if (error != null)
            ColoredBox(
              color: ShadTheme.of(context).colorScheme.destructive,
              child: Center(
                child: Text(
                  error.toString(),
                  style: TextStyle(
                    color:
                        ShadTheme.of(context).colorScheme.destructiveForeground,
                  ),
                ),
              ),
            )
                .animate(onComplete: (_) => setState(() => error = null))
                .fadeIn()
                .fadeOut(delay: const Duration(seconds: 3)),
        ],
      ),
    );
  }

  ButtonBar _buttonBar(AsyncSnapshot<PlayerState> snapshot) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        const ShadButton.outline(
          size: ShadButtonSize.icon,
          icon: Icon(LucideIcons.skipBack),
        ),
        Builder(
          builder: (context) {
            final isPlaying = snapshot.data?.playing ?? false;
            return ShadButton.outline(
              size: ShadButtonSize.icon,
              icon: AnimatedSwitcher(
                duration: animationDuration,
                child: switch (isPlaying) {
                  true => const Icon(key: Key('pause'), LucideIcons.pause),
                  false => const Icon(
                      key: Key('play'),
                      LucideIcons.play,
                    )
                },
              ),
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  if (shouldResetUrl) {
                    try {
                      await audioPlayer.setUrl(focusedStation!.url);
                      shouldResetUrl = false;
                      await audioPlayer.play();
                    } catch (e) {
                      setState(() {
                        error = e;
                        shouldResetUrl = true;
                      });
                    }
                  } else {
                    await audioPlayer.play();
                  }
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
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget(this.url);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.hardEdge,
      child: url != null
          ? ExtendedImage.network(
              url!,
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            )
          : ExtendedImage.asset(
              'assets/images/radio-300.png',
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            ),
    );
  }
}
