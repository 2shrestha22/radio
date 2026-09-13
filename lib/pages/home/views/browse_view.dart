import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:radio/models/province.dart';
import 'package:radio/pages/home/widgets/station_list_view.dart';
import 'package:radio/provider/province_controller.dart';
import 'package:radio/provider/radio.dart';
import 'package:radio/provider/stations.dart';

class BrowseView extends ConsumerWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionList = ref.watch(provinceControllerProvider);

    return CustomScrollView(
      slivers: [
        for (int i = 0; i < sectionList.length; i++)
          _ExpansionWidget(
            province: sectionList[i],
            showDivider: i < sectionList.length - 1,
          ),

      ],
    );
  }
}

class _ExpansionWidget extends ConsumerStatefulWidget {
  const _ExpansionWidget({required this.province, this.showDivider = true});
  final Province province;
  final bool showDivider;

  @override
  ConsumerState<_ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends ConsumerState<_ExpansionWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () => setState(() => expanded = !expanded),
          child: Column(
            children: [
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text(
                  widget.province.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${widget.province.stations.length})',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedArrowDown01, size: 20),
                ),
              ],
            ),
          ),
              if (widget.showDivider) const Divider(height: 0, indent: 16, endIndent: 16),
            ],
          ),
        ),
      ),
      sliver: expanded
          ? StationListView(
              stations: widget.province.stations,
              onTap: (station) async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                return ref
                    .read(radioProvider.notifier)
                    .setFocusedStation(station);
              },
              onFavTap: (station) async {
                ref.read(stationsProvider.notifier).toggleFav(station.id);
              },
            )
          : null,
    );
  }
}
