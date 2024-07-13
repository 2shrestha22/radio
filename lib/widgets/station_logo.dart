import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class StationLogo extends StatelessWidget {
  const StationLogo(this.imageUrl, {super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.hardEdge,
      child: ExtendedImage.network(
        imageUrl,
        cache: true,
        height: 70,
        width: 70,
        cacheHeight: 140,
        cacheWidth: 140,
      ),
    );
  }
}
