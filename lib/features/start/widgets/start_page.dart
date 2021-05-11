import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:viveo_task/common/themes/dimens.dart';
import 'package:viveo_task/common/themes/text_styles.dart';
import 'package:viveo_task/common/widgets/base_screen.dart';
import 'package:viveo_task/common/widgets/company_logo.dart';
import 'package:viveo_task/common/widgets/indexed_container.dart';
import 'package:viveo_task/common/widgets/worm_button.dart';
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
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CompanyLogo(),
          const Spacer(),
          Observer(
            builder: (context) {
              return Expanded(
                child: IndexedContainer(
                  selectedIndex: _startStore.tabIndex,
                  children: [
                    LoginForm(store: _loginStore),
                    SignUpForm(),
                  ],
                ),
              );
            },
          ),
          WormButton(
            onIndexChanged: _startStore.changeTabIndex,
            items: [
              WormItem(
                title: "Login",
                onTap: _loginStore.validateAll,
              ),
              WormItem(
                title: "Sign up",
                onTap: () {},
                enabled: false,
              )
            ],
          ),
          Padding(
            padding: Dimens.screenPadding,
            child: Center(
                child: Text(
              "Forgot password?",
              style: TextStyles.action,
            )),
          )
        ],
      ),
    );
  }
}
