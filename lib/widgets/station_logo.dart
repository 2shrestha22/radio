import 'package:flutter/material.dart';

class StationLogo extends StatelessWidget {
  const StationLogo(this.path, {super.key});

  final String? path;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.hardEdge,
      child: path != null
          ? Image.asset(
              path!,
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            )
          : Image.asset(
              'assets/images/radio-np.png',
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            ),
    );
  }
}
