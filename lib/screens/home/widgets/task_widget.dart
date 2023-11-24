import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/stores.dart';
import '../../../models/models.dart';
import './widgets.dart';

class TaskWidget extends StatefulWidget {
  final TaskModel taskModel;

  const TaskWidget(this.taskModel, {super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final TaskStore taskStore = TaskStore();
  final TasksStore tasksStore = GetIt.I<TasksStore>();

  @override
  void initState() {
    super.initState();

    taskStore.setup(widget.taskModel);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListTile(
          leading: Checkbox(
            value: taskStore.done,
            onChanged: taskStore.setDone,
          ),
          title: InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => TaskDialogWidget(taskStore),
            ),
            child: Text(
              taskStore.title,
              style: Theme.of(context).listTileTheme.titleTextStyle?.copyWith(
                    decoration: taskStore.done ? TextDecoration.lineThrough : null,
                  ),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
            onPressed: () => tasksStore.removeTask(widget.taskModel.index!),
          ),
        );
      },
    );
  }
}
