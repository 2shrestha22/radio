import 'package:flutter/material.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/widgets/radio_control_panel.dart';
import 'package:radio/widgets/station_list.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio')),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final radioState = ref.watch(radioProvider);
          if (radioState.station == null) return const SizedBox.shrink();
          return const RadioControlPanel();
        },
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
          Consumer(
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
              return StationList(
                onTap: (station) {
                  ShadToaster.of(context).hide();
                  return ref
                      .read(radioProvider.notifier)
                      .setFocusedStation(station);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
