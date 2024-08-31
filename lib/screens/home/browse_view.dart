import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:radio/models/province.dart';
import 'package:radio/provider/province_controller.dart';
import 'package:radio/widgets/station_list_view.dart';

class BrowseView extends ConsumerWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionList = ref.watch(provinceControllerProvider);

    return CustomScrollView(
      slivers: [...sectionList.map((e) => ExpansionWidget(province: e))],
    );
  }
}

// class ExpansionItem {
//   bool isExpanded;
// }

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget({super.key, required this.province});
  final Province province;

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Material(
        color: context.colors.card,
        child: InkWell(
          onTap: () => setState(() => expanded = !expanded),
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  widget.province.name,
                  style: context.textStyles.titleLarge,
                ),
                const Spacer(),
                Text(
                  '${widget.province.stations.length} stations',
                  style: context.textStyles.titleSmall.bold,
                ),
              ],
            ),
          ),
        ),
      ),
      sliver: expanded
          ? StationListView(
              onTap: (station) {},
              stations: widget.province.stations,
              onFavTap: (station) {},
            )
          : null,
    );
  }
}
