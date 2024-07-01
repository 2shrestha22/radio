import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radio/provider/stations.dart';
import 'package:radio/radio_station.dart';
import 'package:radio/widgets/station_logo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StationList extends ConsumerWidget {
  const StationList({super.key, required this.onTap});

  final Function(RadioStation station) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioStations = ref.watch(stationsProvider);
    return SliverList.separated(
      separatorBuilder: (context, index) => const Gutter(),
      itemCount: radioStations.length,
      itemBuilder: (context, index) {
        final station = radioStations.elementAt(index);
        return GestureDetector(
          onTap: () => onTap(station),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          ),
        );
      },
    );
  }
}
