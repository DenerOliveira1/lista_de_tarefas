import 'package:shared_preferences/shared_preferences.dart';

class LocalDataService {
  final String _tasksKey = "tasks";
  SharedPreferences? _prefs;

  LocalDataService() {
    SharedPreferences.getInstance().then((value) => _prefs);
  }

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) {
      return _prefs!;
    } else {
      _prefs = await SharedPreferences.getInstance();
      return _prefs!;
    }
  }

  Future<bool> addTask(String task) async {
    List<String> tasks = await getTasks();

    tasks.add(task);

    return await prefs.then((value) => value.setStringList(_tasksKey, tasks));
  }

  Future<bool> updateTask(int index, String task) async {
    List<String> tasks = await getTasks();

    tasks[index] = task;

    return await prefs.then((value) => value.setStringList(_tasksKey, tasks));
  }

  Future<List<String>> getTasks() async {
    List<String> tasks = await prefs.then((value) => value.getStringList(_tasksKey)) ?? [];

    return tasks;
  }

  Future<void> removeTask(int index) async {
    List<String> tasks = await getTasks();

    tasks.removeAt(index);

    await prefs.then((value) => value.setStringList(_tasksKey, tasks));
  }
}