import 'package:flutter/material.dart';

class ShadcnTabBar extends StatefulWidget {
  final List<String> tabs;
  final Function(int) onTabChanged;
  final double height;

  const ShadcnTabBar({
    super.key,
    required this.tabs,
    required this.onTabChanged,
    this.height = 48.0, // Default height
  });

  @override
  _ShadcnTabBarState createState() => _ShadcnTabBarState();
}

class _ShadcnTabBarState extends State<ShadcnTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: List.generate(
            widget.tabs.length,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onTabChanged(index);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: _selectedIndex == index
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    widget.tabs[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.black
                          : Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
