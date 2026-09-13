import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hugeicons/hugeicons.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return HugeIcon(
      icon: HugeIcons.strokeRoundedLoading03,
    ).animate(onPlay: (c) => c.repeat()).rotate(duration: Durations.extralong4);
  }
}
