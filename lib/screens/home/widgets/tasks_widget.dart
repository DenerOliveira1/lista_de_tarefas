import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/stores.dart';
import './widgets.dart';

class TasksWidget extends StatefulWidget {
  final TasksStore tasksStore = GetIt.I<TasksStore>();

  TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.tasksStore.tasksFiltered.length,
          itemBuilder: (context, index) {
            return TaskWidget(widget.tasksStore.tasksFiltered[index]);
          },
        );
      },
    );
  }
}
