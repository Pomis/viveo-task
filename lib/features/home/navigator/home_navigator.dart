import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viveo_task/features/home/widgets/home_screen.dart';

class HomeNavigator {
  static Future<void> openHome(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }
}
