import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndexedContainer extends StatelessWidget {
  final List<Widget> children;
  final int selectedIndex;

  IndexedContainer({required this.children, this.selectedIndex = 0})
      : assert(selectedIndex < children.length, "Index out of range");

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: children[selectedIndex],
    );
  }
}
