import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio/pages/home/widgets/search_field.dart';
import 'package:radio/pages/home/widgets/station_list_view.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/search_input.dart';
import 'package:radio/provider/station_search.dart';
import 'package:radio/provider/stations.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  late final TextEditingController textEditingController;
  final focusNode = FocusNode();

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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          titleSpacing: 0,
          title: SearchField(
            focusNode: focusNode,
            textEditingController: textEditingController,
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            return StationListView(
              stations: ref.watch(stationSearchProvider),
              onTap: (station) async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                focusNode.unfocus();
                return ref
                    .read(radioProvider.notifier)
                    .setFocusedStation(station);
              },
              onFavTap: (station) {
                ref.read(stationsProvider.notifier).toggleFav(station.id);
              },
            );
          },
        ),
      ],
    );
  }
}
