// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on TasksStoreBase, Store {
  late final _$tasksAtom = Atom(name: 'TasksStoreBase.tasks', context: context);

  @override
  List<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'TasksStoreBase.loading', context: context);

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

  late final _$dateSelectedAtom =
      Atom(name: 'TasksStoreBase.dateSelected', context: context);

  @override
  DateTime get dateSelected {
    _$dateSelectedAtom.reportRead();
    return super.dateSelected;
  }

  @override
  set dateSelected(DateTime value) {
    _$dateSelectedAtom.reportWrite(value, super.dateSelected, () {
      super.dateSelected = value;
    });
  }

  late final _$TasksStoreBaseActionController =
      ActionController(name: 'TasksStoreBase', context: context);

  @override
  void setDateSelected(DateTime value) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.setDateSelected');
    try {
      return super.setDateSelected(value);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
loading: ${loading},
dateSelected: ${dateSelected}
    ''';
  }
}
