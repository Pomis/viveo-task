import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:validators2/validators.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final FormErrorState error = FormErrorState();

  late VoidCallback onLoginSuccess;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool inProgress = false;

  @computed
  bool get canLogin => !error.hasErrors;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
  }

  Future<void> tryLogin() async {
    validatePassword(password);
    validateEmail(email);
    if (canLogin) {
      inProgress = true;
      await Future.delayed(const Duration(seconds: 2));
      inProgress = false;
      onLoginSuccess();
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => email != null || password != null;
}