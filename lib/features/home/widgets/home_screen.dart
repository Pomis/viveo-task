import 'package:flutter/widgets.dart';
import 'package:viveo_task/common/themes/text_styles.dart';
import 'package:viveo_task/common/widgets/base_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: const Center(
        child: Text(
          "Home screen",
          style: TextStyles.logo,
        ),
      ),
    );
  }
}
