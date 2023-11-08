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
  DateTime date = DateTime.now();

  @observable
  bool done = false;

  @action
  void setTitle(String value) => title = value;

  @action
  void setDone(bool? value) => done = value ?? false;

  @action
  void setDate(DateTime value) => date = value;

  bool get titleValid {
    return title.trim().isNotEmpty;
  }

  @computed
  String? get titleError {
    if (titleValid) {
      return null;
    } else {
      return AppStrings.titleError;
    }
  }
}