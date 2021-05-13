import 'package:flutter/material.dart';

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


class ScrollKeyboardCloser extends StatelessWidget {
  final Widget child;

  ScrollKeyboardCloser({required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is UserScrollNotification) {
          // close keyboard
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: child,
    );
  }
}