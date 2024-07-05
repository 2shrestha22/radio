import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/widgets/station_logo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StationListView extends StatelessWidget {
  const StationListView({
    super.key,
    required this.onTap,
    required this.stations,
  });

  final Function(RadioStation station) onTap;
  final List<RadioStation> stations;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Gutter(),
      itemCount: stations.length,
      itemBuilder: (context, index) {
        final station = stations.elementAt(index);
        return GestureDetector(
          onTap: () => onTap(station),
          child: ShadCard(
            padding: const EdgeInsets.all(12),
            trailing: StationLogo(station.logo),
            title: Text(
              station.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            content: station.frequency != null
                ? Text('${station.frequency} MHz',
                    style: const TextStyle(fontWeight: FontWeight.bold))
                : const Text(
                    'Online Radio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            footer: Text(
              station.address ?? '--',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
