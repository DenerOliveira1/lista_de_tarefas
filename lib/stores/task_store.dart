import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';
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
  String task = '';

  @observable
  DateTime date = DateTime.now();

  @observable
  bool done = false;
}