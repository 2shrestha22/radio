import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/pages/home/views/browse_view.dart';
import 'package:radio/pages/home/views/favorite_view.dart';
import 'package:radio/pages/home/views/search_view.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/widgets/radio_control_panel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  static const _views = [FavoriteView(), SearchView(), BrowseView()];

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
      appBar: AppBar(title: const Text('Radio NP')),
      resizeToAvoidBottomInset: false,
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(LucideIcons.heart),
            selectedIcon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.listMusic),
            label: 'Browse',
          ),
        ],
      ),
    );
  }
}
