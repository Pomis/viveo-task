import 'package:mobx/mobx.dart';
import 'package:validators2/validators.dart';

part 'start_store.g.dart';

class StartStore = _StartStore with _$StartStore;

abstract class _StartStore with Store {
  @observable
  int tabIndex = 0;

  @action
  Future changeTabIndex(int index) async {
    tabIndex = index;
  }
}