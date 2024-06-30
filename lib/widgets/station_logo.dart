import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class StationLogo extends StatelessWidget {
  const StationLogo(this.url, {super.key});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.hardEdge,
      child: url != null
          ? ExtendedImage.network(
              url!,
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            )
          : ExtendedImage.asset(
              'assets/images/radio-300.png',
              height: 70,
              width: 70,
              cacheHeight: 140,
              cacheWidth: 140,
            ),
    );
  }
}
