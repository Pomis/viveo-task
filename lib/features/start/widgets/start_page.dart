import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:viveo_task/common/themes/dimens.dart';
import 'package:viveo_task/common/themes/text_styles.dart';
import 'package:viveo_task/common/widgets/base_screen.dart';
import 'package:viveo_task/common/widgets/company_logo.dart';
import 'package:viveo_task/common/widgets/indexed_container.dart';
import 'package:viveo_task/common/widgets/scrollable_footer.dart';
import 'package:viveo_task/common/widgets/worm_button.dart';
import 'package:viveo_task/features/home/navigator/home_navigator.dart';
import 'package:viveo_task/features/login/stores/login_store.dart';
import 'package:viveo_task/features/login/widgets/login_form.dart';
import 'package:viveo_task/features/signup/widgets/signup_form.dart';
import 'package:viveo_task/features/start/stores/start_store.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  StartStore _startStore = StartStore();
  LoginStore _loginStore = LoginStore();

  @override
  void initState() {
    super.initState();
    _loginStore.onLoginSuccess = () => HomeNavigator.openHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: ScrollableFlex(
        children: [
          CompanyLogo(),
          const Spacer(),
          _content(),
          _workButtons(),
          Padding(
            padding: Dimens.screenPadding,
            child: Center(
                child: Text(
              "Forgot password?",
              style: TextStyles.action,
            )),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Column(
      children: [
        Observer(
          builder: (context) {
            return IndexedContainer(
              selectedIndex: _startStore.tabIndex,
              children: [
                LoginForm(store: _loginStore),
                SignUpForm(),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _workButtons() {
    return Observer(
      builder: (context) {
        return WormButton(
          inProgress: _loginStore.inProgress,
          onIndexChanged: _startStore.changeTabIndex,
          selectedTab: _startStore.tabIndex,
          items: [
            WormItem(
              title: "Login",
              onTap: _loginStore.tryLogin,
            ),
            WormItem(
              title: "Sign up",
              onTap: () {},
              enabled: false,
            )
          ],
        );
      },
    );
  }
}
