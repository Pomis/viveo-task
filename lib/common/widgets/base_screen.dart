import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:viveo_task/common/themes/colors.dart';
import 'package:viveo_task/common/themes/dimens.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  BaseScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Theme(
        data: ThemeData(
          primaryColor: colorPink,
          primaryColorDark: colorDarkPink,
          backgroundColor: colorDarkViolet,
          hintColor: colorPink,
        ),
        child: Scaffold(
          backgroundColor: colorDarkViolet,
          body: SafeArea(
            child: Padding(
              padding: Dimens.screenPadding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
