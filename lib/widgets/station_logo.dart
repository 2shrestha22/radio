import 'package:flutter/material.dart';

class StationLogo extends StatelessWidget {
  const StationLogo(this.imageUrl, {super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          imageUrl,
          height: 70,
          width: 70,
          cacheHeight: 140,
          cacheWidth: 140,
        ));
  }
}
