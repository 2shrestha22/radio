import 'package:flutter/material.dart';
import 'package:radio/models/radio_station.dart';

class RemoveFavDialog extends StatelessWidget {
  const RemoveFavDialog({super.key, required this.station});

  final RadioStation station;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remove from favorites?'),
      content: Text(
        'Are you sure you want to remove ${station.name}?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Remove'),
        ),
      ],
    );
  }
}
