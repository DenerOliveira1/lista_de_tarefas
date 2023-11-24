import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import '../services/services.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  final LocalDataService localDataService = LocalDataService();
  final DateTime _now = DateTime.now();
  final DateTime _startOfNextWeek = DateTime.now().add(Duration(days: 7 - DateTime.now().weekday));
  final DateTime _endOfNextWeek = DateTime.now().add(Duration(days: 7 - DateTime.now().weekday)).add(const Duration(days: 6));

  TasksStoreBase() {
    getTasks().then((value) {
      filterTasks();
    });
  }

  List<TaskModel> tasks = ObservableList<TaskModel>();

  List<TaskModel> tasksFiltered = ObservableList<TaskModel>();

  Iterable<TaskModel> get tasksToday => tasks.where(
        (element) => element.date.day == _now.day && element.date.month == _now.month && element.date.year == _now.year,
      );

  Iterable<TaskModel> get tasksTomorrow => tasks.where((element) => element.date.day == _now.day + 1 && element.date.month == _now.month && element.date.year == _now.year);

  Iterable<TaskModel> get tasksForNextWeek => tasks.where((element) => element.date.isAfter(_startOfNextWeek.subtract(const Duration(days: 1))) && element.date.isBefore(_endOfNextWeek.add(const Duration(days: 1))));

  Iterable<TaskModel> get tasksForNextMonth => tasks.where((element) => element.date.month == _now.month + 1 && element.date.year == _now.year);

  Iterable<TaskModel> get tasksForNextYear => tasks.where((element) => element.date.year == _now.year + 1);

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

    /// Atualizado o index dos registros novamente
    for (var entry in tasks.asMap().entries) {
      tasks[entry.key].index = entry.key;
    }

    filterTasks();
  }

  Future<void> getTasks() async {
    tasks.clear();

    List<String> list = await localDataService.getTasks();

    for (var entry in list.asMap().entries) {
      TaskModel task = TaskModel.fromString(entry.value);
      task.index = entry.key;
      tasks.add(task);
    }

    filterTasks();
  }

  @action
  void changeDate(DateTime selectedDay, DateTime focusedDay) {
    dateSelected = selectedDay;
    filterTasks();
  }

  filterTasks() {
    tasksFiltered.clear();
    tasksFiltered.addAll(
      tasks.where(
        (element) => element.date.day == dateSelected.day && element.date.month == dateSelected.month && element.date.year == dateSelected.year,
      ),
    );
  }
}
