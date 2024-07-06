import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio/provider/favorite_stations.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/search_stations.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/widgets/radio_control_panel.dart';
import 'package:radio/widgets/station_list_view.dart';
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
        ref
            .read(searchStationsProvider.notifier)
            .search(textEditingController.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
        surfaceTintColor: Colors.transparent,
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          ref.listen(
            radioProvider,
            (previous, next) {
              if (previous?.error != next.error) {
                ShadToaster.of(context).show(ShadToast.destructive(
                  title: Text(next.error.toString()),
                  padding: const EdgeInsets.all(8),
                ));
              }
            },
          );

          final radioState = ref.watch(radioProvider);
          if (radioState.station == null) return const SizedBox.shrink();
          return const RadioControlPanel();
        },
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: ShadTheme.of(context).breakpoints.sm.value),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShadTabs(
              contentConstraints: const BoxConstraints(maxHeight: 300),
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
                          return StationListView(
                            stations: ref.watch(favoriteStationsProvider),
                            onTap: (station) async {
                              ShadToaster.of(context).hide();
                              focusNode.unfocus();
                              return ref
                                  .read(radioProvider.notifier)
                                  .setFocusedStation(station);
                            },
                            onFavTap: (station) async {
                              final shouldRemove = await showShadDialog(
                                context: context,
                                builder: (context) => ShadDialog.alert(
                                  title: Text(
                                      'Remove ${station.name} from favorite?'),
                                  description: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      '${station.name} will be removed from your favorite list. You can add it again later from all station list.',
                                    ),
                                  ),
                                  actions: [
                                    ShadButton.outline(
                                      text: const Text('Cancel'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                    ShadButton(
                                      text: const Text('Remove'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                    ),
                                  ],
                                ),
                              );

                              if (shouldRemove) {
                                ref
                                    .read(stationsProvider.notifier)
                                    .toggleFav(station.id);
                              }
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
                          return StationListView(
                            stations: ref.watch(searchStationsProvider),
                            onTap: (station) async {
                              ShadToaster.of(context).hide();
                              focusNode.unfocus();
                              return ref
                                  .read(radioProvider.notifier)
                                  .setFocusedStation(station);
                            },
                            onFavTap: (station) {
                              ref
                                  .read(stationsProvider.notifier)
                                  .toggleFav(station.id);
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
      ),
    );
  }
}
