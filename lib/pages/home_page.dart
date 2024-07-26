import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/const/const.dart';
import 'package:radio/models/radio_station.dart';
import 'package:radio/provider/favorite_stations.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/search_input.dart';
import 'package:radio/provider/station_search.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/widgets/radio_control_panel.dart';
import 'package:radio/widgets/station_list_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final TextEditingController textEditingController;
  final focusNode = FocusNode();

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController()
      ..addListener(() {
        ref
            .read(searchInputProvider.notifier)
            .onChange(textEditingController.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      useDrawer: false,
      selectedIndex: _selectedTab,
      onSelectedIndexChange: (int index) {
        setState(() {
          _selectedTab = index;
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(LucideIcons.heart),
          label: 'Favourite',
        ),
        NavigationDestination(
          icon: Icon(LucideIcons.listMusic),
          label: 'Browse',
        ),
      ],
      body: (context) {
        return Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: _selectedTab,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        floating: true,
                        surfaceTintColor: Colors.transparent,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        title: const Text('Radio NP'),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return StationListView(
                            stations: ref.watch(favoriteStationsProvider),
                            onTap: (station) async {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              focusNode.unfocus();
                              return ref
                                  .read(radioProvider.notifier)
                                  .setFocusedStation(station);
                            },
                            onFavTap: (station) async {
                              final shouldRemove = await showDialog<bool?>(
                                context: context,
                                builder: (context) =>
                                    RemoveFavDialog(station: station),
                              );

                              if (shouldRemove ?? false) {
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
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        floating: true,
                        surfaceTintColor: Colors.transparent,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        title: const Text('Radio NP'),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(60),
                          child: SearchField(
                            focusNode: focusNode,
                            textEditingController: textEditingController,
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return StationListView(
                            stations: ref.watch(stationSearchProvider),
                            onTap: (station) async {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
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
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                ref.listen(
                  radioProvider,
                  (previous, next) {
                    if (previous?.error != next.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(next.error.toString())));
                    }
                  },
                );

                final radioState = ref.watch(radioProvider);
                if (radioState.station == null) {
                  return const SizedBox.shrink();
                }
                return const RadioControlPanel();
              },
            ),
          ],
        );

        // return DefaultTabController(
        //   length: 2,
        //   child: Center(
        //     child: ConstrainedBox(
        //       constraints: const BoxConstraints(
        //         maxWidth: 640,
        //       ),
        //       child: Column(
        //         children: [
        //           TabBar(
        //             labelStyle: Theme.of(context)
        //                 .textTheme
        //                 .titleMedium
        //                 ?.copyWith(fontWeight: FontWeight.bold),
        //             tabs: const [
        //               Tab(
        //                 text: 'Favorite',
        //                 icon: Icon(LucideIcons.heart),
        //               ),
        //               Tab(
        //                 text: 'Browse',
        //                 icon: Icon(LucideIcons.listMusic),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
      },
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.focusNode,
    required this.textEditingController,
  });

  final FocusNode focusNode;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(LucideIcons.search),
            suffixIcon: Consumer(
              builder: (context, ref, child) {
                final isNotEmpty = ref.watch(
                    searchInputProvider.select((value) => value.isNotEmpty));
                return AnimatedOpacity(
                  opacity: isNotEmpty ? 1 : 0,
                  duration: animationDuration,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(LucideIcons.x),
                    onPressed: textEditingController.clear,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RemoveFavDialog extends StatelessWidget {
  const RemoveFavDialog({
    super.key,
    required this.station,
  });

  final RadioStation station;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Remove ${station.name} from favorite?'),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          '${station.name} will be removed from your favorite list. You can add it again later from all station list.',
        ),
      ),
      actions: [
        OutlinedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        FilledButton(
          child: const Text('Remove'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
