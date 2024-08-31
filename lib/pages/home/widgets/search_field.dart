import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:radio/provider/search_input.dart';
import 'package:radio/utils/const.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.focusNode,
    required this.textEditingController,
  });

  final FocusNode focusNode;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(LucideIcons.search),
            suffixIcon: Consumer(
              builder: (context, ref, child) {
                final isNotEmpty = ref.watch(
                    searchInputProvider.select((value) => value.isNotEmpty));
                return AnimatedOpacity(
                  opacity: isNotEmpty ? 1 : 0,
                  duration: animationDuration,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(LucideIcons.x),
                    onPressed: textEditingController.clear,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
