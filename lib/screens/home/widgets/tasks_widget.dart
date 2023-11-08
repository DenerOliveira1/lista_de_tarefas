import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/shared.dart';
import '../../../stores/stores.dart';

class TasksWidget extends StatefulWidget {
  final TasksStore tasksStore;

  const TasksWidget(this.tasksStore, {super.key});

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
            return ListTile(
              leading: Checkbox(
                value: widget.tasksStore.tasksFiltered[index].done,
                onChanged: (bool? value) {
                  widget.tasksStore.changeTaskDone(widget.tasksStore.tasksFiltered[index].index!, value);

                  setState(() {
                    /// Adicionado aqui só para resolver temporário a atualização de status da task
                  });
                },
              ),
              title: Text(widget.tasksStore.tasksFiltered[index].title),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ),
                onPressed: () => widget.tasksStore.removeTask(widget.tasksStore.tasksFiltered[index].index!),
              ),
              onTap: () => context.goNamed(
                AppStrings.taskRouteName,
                pathParameters: {
                  'task': widget.tasksStore.tasksFiltered[index].toString(),
                },
              ),
            );
          },
        );
      },
    );
  }
}
