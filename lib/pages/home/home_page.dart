import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/pages/home/views/browse_view.dart';
import 'package:radio/pages/home/views/favorite_view.dart';
import 'package:radio/pages/home/views/search_view.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/widgets/radio_control_panel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio NP'),
        surfaceTintColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 3,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 640,
            ),
            child: Column(
              children: [
                TabBar(
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: 'Favorite',
                      icon: Icon(LucideIcons.heart),
                    ),
                    Tab(
                      text: 'Browse',
                      icon: Icon(LucideIcons.listMusic),
                    ),
                    Tab(
                      text: 'Search',
                      icon: Icon(LucideIcons.search),
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      FavoriteView(),
                      BrowseView(),
                      SearchView(),
                    ],
                  ),
                ),
                SafeArea(
                  child: Consumer(
                    builder: (context, ref, child) {
                      ref.listen(
                        radioProvider,
                        (previous, next) {
                          if (next.error != null &&
                              previous?.error != next.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(next.error.toString())),
                            );
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
