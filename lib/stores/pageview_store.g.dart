// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageview_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageViewStore on PageViewStoreBase, Store {
  late final _$currentIndexAtom =
      Atom(name: 'PageViewStoreBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$PageViewStoreBaseActionController =
      ActionController(name: 'PageViewStoreBase', context: context);

  @override
  void setCurrentScreen(int value) {
    final _$actionInfo = _$PageViewStoreBaseActionController.startAction(
        name: 'PageViewStoreBase.setCurrentScreen');
    try {
      return super.setCurrentScreen(value);
    } finally {
      _$PageViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
