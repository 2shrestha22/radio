import 'package:flutter/material.dart';
import 'package:radio/models/radio_station.dart';

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
