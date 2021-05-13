import 'package:flutter/material.dart';
import 'package:viveo_task/common/widgets/scroll_keyboard_closer.dart';

class ScrollableFlex extends StatelessWidget {
  final List<Widget> children;

  const ScrollableFlex({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return ScrollKeyboardCloser(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: children,
              ),
            ),
          ),
        ),
      );
    });
  }
}