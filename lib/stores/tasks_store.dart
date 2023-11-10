import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import '../services/services.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  final LocalDataService localDataService = LocalDataService();

  TasksStoreBase() {
    getTasks().then((value) {
      _filterTasks();
    });
  }

  List<TaskModel> tasks = ObservableList<TaskModel>();

  List<TaskModel> tasksFiltered = ObservableList<TaskModel>();

  @observable
  bool loading = false;

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void changeTaskDone(int index, bool? value) {
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
    }
  }

  @action
  void changeDate(DateTime selectedDay, DateTime focusedDay) {
    dateSelected = selectedDay;
    _filterTasks();
  }

  _filterTasks() {
    tasksFiltered.clear();
    tasksFiltered.addAll(
      tasks.where((element) => element.date.day == dateSelected.day && element.date.month == dateSelected.month && element.date.year == dateSelected.year),
    );
  }
}
