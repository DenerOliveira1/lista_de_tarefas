import 'package:mobx/mobx.dart';

import '../models/task_model.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  @observable
  List<TaskModel> tasks = ObservableList<TaskModel>();

  @observable
  bool loading = false;

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void setDateSelected(DateTime value) => dateSelected = value;
}