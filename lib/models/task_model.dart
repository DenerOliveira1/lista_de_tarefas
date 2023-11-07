class TaskModel {
  String title;
  DateTime day;
  bool done;

  TaskModel({
    required this.title,
    required this.day,
    this.done = false,
  });
}
