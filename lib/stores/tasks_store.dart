import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import '../services/services.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  final LocalDataService localDataService = LocalDataService();

  TasksStoreBase() {
    getTasks();
  }

  List<TaskModel> tasks = ObservableList<TaskModel>();

  List<TaskModel> tasksFiltered = ObservableList<TaskModel>();

  @observable
  bool loading = false;

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void setDateSelected(DateTime value) => dateSelected = value;

  @action
  void changeTaskDone(int index, bool? value) async {
    tasks.firstWhere((element) {
      if (element.index == index) {
        element.done = value ?? false;

        localDataService.updateTask(index, element.toString());

        return true;
      } else {
        return false;
      }
    });
  }

  @action
  void removeTask(int index) {
    localDataService.removeTask(index);

    /// Removo a task com o index passado
    tasks.removeWhere((element) => element.index == index);
    tasksFiltered.removeWhere((element) => element.index == index);

    /// Atualizado o index dos registros novamente
    for (var entry in tasks.asMap().entries) {
      tasks[entry.key].index = entry.key;
      tasksFiltered[entry.key].index = entry.key;
    }
  }

  Future<void> getTasks() async {
    tasks.clear();
    tasksFiltered.clear();

    List<String> list = await localDataService.getTasks();

    for (var entry in list.asMap().entries) {
      TaskModel task = TaskModel.fromString(entry.value);
      task.index = entry.key;
      tasks.add(task);
      tasksFiltered.add(task);
    }
  }
}