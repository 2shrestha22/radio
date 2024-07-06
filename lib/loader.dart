import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(LucideIcons.loader)
        .animate(onPlay: (c) => c.repeat())
        .rotate(duration: Durations.extralong4);
  }
}
