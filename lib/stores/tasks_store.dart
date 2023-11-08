import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import '../services/services.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  final LocalDataService localDataService = LocalDataService();

  TasksStoreBase() {
    localDataService.getTasks().then((value) {
      for (String task in value) {
        tasks.add(TaskModel.fromString(task));
        tasksFiltered.add(TaskModel.fromString(task));
      }
    });
  }

  @observable
  List<TaskModel> tasks = ObservableList<TaskModel>();

  @observable
  List<TaskModel> tasksFiltered = ObservableList<TaskModel>();

  @observable
  bool loading = false;

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void setDateSelected(DateTime value) => dateSelected = value;

  @action
  void changeTaskDone(int index, bool? value) {
    print('aqui');
    print(value);
    print(index);
    tasksFiltered[index].done = value ?? false;
  }
}