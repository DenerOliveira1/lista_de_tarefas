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
  Computed<String?>? _$noteErrorComputed;

  @override
  String? get noteError =>
      (_$noteErrorComputed ??= Computed<String?>(() => super.noteError,
              name: 'TaskStoreBase.noteError'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'TaskStoreBase.isFormValid'))
          .value;
  Computed<VoidCallback?>? _$selectDateTimePressedComputed;

  @override
  VoidCallback? get selectDateTimePressed =>
      (_$selectDateTimePressedComputed ??= Computed<VoidCallback?>(
              () => super.selectDateTimePressed,
              name: 'TaskStoreBase.selectDateTimePressed'))
          .value;
  Computed<VoidCallback?>? _$savePressedComputed;

  @override
  VoidCallback? get savePressed => (_$savePressedComputed ??=
          Computed<VoidCallback?>(() => super.savePressed,
              name: 'TaskStoreBase.savePressed'))
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

  late final _$noteAtom = Atom(name: 'TaskStoreBase.note', context: context);

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
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

  late final _$timeAtom = Atom(name: 'TaskStoreBase.time', context: context);

  @override
  TimeOfDay? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
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

  late final _$selectDateTimeAtom =
      Atom(name: 'TaskStoreBase.selectDateTime', context: context);

  @override
  bool get selectDateTime {
    _$selectDateTimeAtom.reportRead();
    return super.selectDateTime;
  }

  @override
  set selectDateTime(bool value) {
    _$selectDateTimeAtom.reportWrite(value, super.selectDateTime, () {
      super.selectDateTime = value;
    });
  }

  late final _$_saveAsyncAction =
      AsyncAction('TaskStoreBase._save', context: context);

  @override
  Future<void> _save() {
    return _$_saveAsyncAction.run(() => super._save());
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
  void setNote(String value) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.setNote');
    try {
      return super.setNote(value);
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
  void setTime(TimeOfDay? value) {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase.setTime');
    try {
      return super.setTime(value);
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
  void _selectDateTime() {
    final _$actionInfo = _$TaskStoreBaseActionController.startAction(
        name: 'TaskStoreBase._selectDateTime');
    try {
      return super._selectDateTime();
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
note: ${note},
date: ${date},
time: ${time},
done: ${done},
selectDateTime: ${selectDateTime},
titleError: ${titleError},
noteError: ${noteError},
isFormValid: ${isFormValid},
selectDateTimePressed: ${selectDateTimePressed},
savePressed: ${savePressed}
    ''';
  }
}
