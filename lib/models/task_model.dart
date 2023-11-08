import 'dart:convert';

import 'package:flutter/material.dart';

class TaskModel {
  String title;
  String note;
  DateTime? date;
  TimeOfDay? time;
  bool done;

  TaskModel({
    required this.title,
    required this.note,
    this.date,
    this.time,
    this.done = false,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'note': note,
        'date': date,
        'time': time,
        'done': done,
      };

  static TaskModel fromString(String task) {
    Map<String, dynamic> json = jsonDecode(task);

    return TaskModel(
      title: json['title'],
      note: json['note'],
      date: json['date'],
      time: json['time'],
      done: json['done'],
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
