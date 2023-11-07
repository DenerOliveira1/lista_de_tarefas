import 'package:mobx/mobx.dart';

import '../models/task_model.dart';
import '../services/services.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  final LocalDataService _localDataService = LocalDataService();

  @observable
  List<TaskModel> tasks = ObservableList<TaskModel>();

  @observable
  bool loading = false;

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void setDateSelected(DateTime value) => dateSelected = value;
}