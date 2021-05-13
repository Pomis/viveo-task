import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:viveo_task/common/widgets/edit_text.dart';
import 'package:viveo_task/features/login/stores/login_store.dart';

class LoginForm extends StatefulWidget {
  final LoginStore store;

  LoginForm({required this.store});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void initState() {
    super.initState();
    widget.store.setupValidations();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return EditText(
                  onChanged: (value) => widget.store.email = value,
                  label: 'Email',
                  hintText: 'Enter your email address',
                  errorText: widget.store.error.email,
                );
              },
            ),
            Observer(
              builder: (_) {
                return EditText(
                  onChanged: (value) => widget.store.password = value,
                  label: 'Password',
                  hintText: 'Set a password',
                  isObscure: true,
                  errorText: widget.store.error.password,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
