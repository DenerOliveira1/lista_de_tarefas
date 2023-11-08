import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';
import '../shared/shared.dart';
import './stores.dart';

part 'task_store.g.dart';

class TaskStore = TaskStoreBase with _$TaskStore;

abstract class TaskStoreBase with Store {
  final TasksStore _tasksStore = GetIt.I<TasksStore>();

  @observable
  String success = '';

  @observable
  String error = '';

  @observable
  bool loading = false;

  @observable
  String title = '';

  @observable
  String note = '';

  @observable
  DateTime? date;

  @observable
  TimeOfDay? time;

  @observable
  bool done = false;

  @action
  void setTitle(String value) => title = value;

  @action
  void setNote(String value) => note = value;

  @action
  void setDate(DateTime? value) => date = value;

  @action
  void setTime(TimeOfDay? value) => time = value;

  @action
  void setDone(bool? value) => done = value ?? false;

  bool get titleValid {
    return title.trim().isNotEmpty;
  }

  bool get noteValid {
    return true;
  }

  @computed
  String? get titleError {
    if (titleValid) {
      return null;
    } else {
      return AppStrings.titleError;
    }
  }

  @computed
  String? get noteError {
    if (noteValid) {
      return null;
    } else {
      return AppStrings.noteError;
    }
  }

  @computed
  bool get isFormValid {
    return titleValid
        && noteValid;
  }

  @computed
  VoidCallback? get savePressed {
    return isFormValid ? _save : null;
  }

  @action
  Future<void> _save() async {
    try {
      loading = true;

      TaskModel task = _generateModel();

      if (await _tasksStore.localDataService.saveTask(task.toString())) {
        _tasksStore.tasks.add(task);
      } else {
        throw "Erro";
      }
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  TaskModel _generateModel() {
    return TaskModel(
      title: title,
      note: note,
      date: date,
      time: time,
      done: done,
    );
  }
}