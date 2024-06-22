import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(LucideIcons.loader)
        .animate(onPlay: (c) => c.repeat())
        .rotate(duration: Durations.extralong4);
  }
}
