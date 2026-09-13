import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlayingIndicator extends StatelessWidget {
  const PlayingIndicator({super.key, this.color, this.size = 16});
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final barColor = color ?? Theme.of(context).colorScheme.primary;
    final barWidth = size / 5;
    return SizedBox(
      width: size,
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (i) {
          return Animate(
            onPlay: (c) => c.repeat(reverse: true),
            effects: [
              ScaleEffect(
                begin: const Offset(1, 0.3),
                end: const Offset(1, 1),
                duration: Duration(milliseconds: 400 + i * 150),
                curve: Curves.easeInOut,
              ),
            ],
            child: Container(
              width: barWidth,
              height: size,
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(barWidth / 2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
