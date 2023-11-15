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
  final GlobalKey<State> observerKey = GlobalKey<State>();

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
  DateTime date = DateTime.now();

  @observable
  TimeOfDay? time;

  @observable
  bool done = false;

  int? index;

  @action
  void setTitle(String value) => title = value;

  @action
  void setNote(String value) => note = value;

  @action
  void setDate(DateTime value) => date = value;

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

      if (index == null) {
        if (await _tasksStore.localDataService.addTask(task.toString())) {
          task.index = _tasksStore.tasks.length;
          _tasksStore.tasks.add(task);
          _tasksStore.tasksFiltered.add(task);
        } else {
          throw "Erro";
        }
      } else {
        if (await _tasksStore.localDataService.updateTask(index!, task.toString())) {
          await _tasksStore.getTasks();
        } else {
          throw "Erro";
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      error = index == null ? AppStrings.errorAddTask : AppStrings.errorUpdateTask;
    } finally {
      if (error.isEmpty) {
        //success = index == null ? AppStrings.successAddTask : AppStrings.successUpdateTask;
        Navigator.of(observerKey.currentContext!).pop();
      }

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

  void loadTask(String taskString) {
    TaskModel task = TaskModel.fromString(taskString);

    title = task.title;
    note = task.note;
    date = task.date;
    time = task.time;
    index = task.index;
  }
}