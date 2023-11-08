// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on TaskStoreBase, Store {
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: 'TaskStoreBase.titleError'))
          .value;

  late final _$successAtom =
      Atom(name: 'TaskStoreBase.success', context: context);

  @override
  String get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(String value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$errorAtom = Atom(name: 'TaskStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'TaskStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$titleAtom = Atom(name: 'TaskStoreBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$dateAtom = Atom(name: 'TaskStoreBase.date', context: context);

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$doneAtom = Atom(name: 'TaskStoreBase.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$TaskStoreBaseActionController =
      ActionController(name: 'TaskStoreBase', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDone(bool? value) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.setDone');
    try {
      return super.setDone(value);
    } finally {
      _$TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime value) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
success: ${success},
error: ${error},
loading: ${loading},
title: ${title},
date: ${date},
done: ${done},
titleError: ${titleError}
    ''';
  }
}
