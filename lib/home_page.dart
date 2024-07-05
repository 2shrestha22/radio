import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio/provider/favorite_stations.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/widgets/radio_control_panel.dart';
import 'package:radio/widgets/station_list.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final TextEditingController textEditingController;
  final focusNode = FocusNode();
  final tabController = ShadTabsController(defaultValue: 1);

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController()
      ..addListener(() {
        ref.read(stationsProvider.notifier).search(textEditingController.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Radio'),
          surfaceTintColor: Colors.transparent,
        ),
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) {
            final radioState = ref.watch(radioProvider);
            if (radioState.station == null) return const SizedBox.shrink();
            return const RadioControlPanel();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShadTabs(
            expandContent: true,
            controller: tabController,
            tabs: [
              ShadTab<int>(
                value: 1,
                text: const Text('Favorite'),
                content: CustomScrollView(
                  slivers: [
                    Consumer(
                      builder: (context, ref, child) {
                        ref.listen(
                          radioProvider,
                          (previous, next) {
                            if (previous?.error != next.error) {
                              ShadToaster.of(context)
                                  .show(ShadToast.destructive(
                                title: Text(next.error.toString()),
                                padding: const EdgeInsets.all(8),
                              ));
                            }
                          },
                        );
                        return StationListView(
                          stations: ref.watch(favoriteStationsProvider),
                          onTap: (station) {
                            ShadToaster.of(context).hide();
                            focusNode.unfocus();
                            return ref
                                .read(radioProvider.notifier)
                                .setFocusedStation(station);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              ShadTab<int>(
                value: 2,
                text: const Text('Browse'),
                content: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      surfaceTintColor: Colors.transparent,
                      flexibleSpace: ShadInput(
                        focusNode: focusNode,
                        controller: textEditingController,
                        placeholder: const Text('Search'),
                        decoration: const ShadDecoration(
                          secondaryFocusedBorder: ShadBorder.none,
                          secondaryBorder: ShadBorder.none,
                        ),
                        suffix: ShadButton.ghost(
                          width: 24,
                          height: 24,
                          foregroundColor:
                              ShadTheme.of(context).colorScheme.border,
                          padding: EdgeInsets.zero,
                          decoration: const ShadDecoration(
                            secondaryBorder: ShadBorder.none,
                            secondaryFocusedBorder: ShadBorder.none,
                          ),
                          icon: const Icon(LucideIcons.x),
                          onPressed: () => textEditingController.clear(),
                        ),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        ref.listen(
                          radioProvider,
                          (previous, next) {
                            if (previous?.error != next.error) {
                              ShadToaster.of(context)
                                  .show(ShadToast.destructive(
                                title: Text(next.error.toString()),
                                padding: const EdgeInsets.all(8),
                              ));
                            }
                          },
                        );
                        return StationListView(
                          stations: ref.watch(stationsProvider),
                          onTap: (station) {
                            ShadToaster.of(context).hide();
                            focusNode.unfocus();
                            return ref
                                .read(radioProvider.notifier)
                                .setFocusedStation(station);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
