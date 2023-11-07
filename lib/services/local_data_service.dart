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

  Future<void> saveTasks(List<String> tasks) async {
    await prefs.then((value) => value.setStringList(_tasksKey, tasks));
  }

  Future<List<String>?> getTasks() async {
    await prefs.then((value) => value.getStringList(_tasksKey));
  }
}