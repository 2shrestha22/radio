import 'package:extended_image/extended_image.dart';
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
          ? ExtendedImage.asset(
              path!,
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            )
          : ExtendedImage.asset(
              'assets/images/radio-512.png',
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            ),
    );
  }
}
