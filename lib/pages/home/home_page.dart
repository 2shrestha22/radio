import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radio/pages/home/views/browse_view.dart';
import 'package:radio/pages/home/views/favorite_view.dart';
import 'package:radio/pages/home/widgets/station_search_delegate.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/widgets/radio_control_panel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  static const _views = [FavoriteView(), BrowseView()];

  @override
  Widget build(BuildContext context) {
    ref.listen(radioProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });

    final radioState = ref.watch(radioProvider);
    final hasStation = radioState.station != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio NP'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(index: _selectedIndex, children: _views),
              ),
              if (hasStation)
                const SafeArea(top: false, child: RadioControlPanel()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          if (i == 2) {
            showSearch(context: context, delegate: StationSearchDelegate(ref));
          } else {
            setState(() => _selectedIndex = i);
          }
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedFavourite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedMenuSquare),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
