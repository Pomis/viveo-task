// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StartStore on _StartStore, Store {
  final _$tabIndexAtom = Atom(name: '_StartStore.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$changeTabIndexAsyncAction = AsyncAction('_StartStore.changeTabIndex');

  @override
  Future<dynamic> changeTabIndex(int index) {
    return _$changeTabIndexAsyncAction.run(() => super.changeTabIndex(index));
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex}
    ''';
  }
}
