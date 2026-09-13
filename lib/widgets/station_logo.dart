import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:radio/utils/const.dart';

class StationLogo extends StatelessWidget {
  const StationLogo(this.imageUrl, {super.key, this.size = 70});

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.12),
      clipBehavior: Clip.hardEdge,
      child: ExtendedImage.network(
        imageUrl,
        cache: true,
        height: size,
        width: size,
        cacheHeight: (size * 2).toInt(),
        cacheWidth: (size * 2).toInt(),
      ),
    );
  }
}
