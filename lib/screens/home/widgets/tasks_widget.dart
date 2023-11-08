import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../stores/stores.dart';

class TasksWidget extends StatelessWidget {
  final TasksStore tasksStore;

  const TasksWidget(this.tasksStore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: tasksStore.tasksFiltered.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: tasksStore.tasksFiltered[index].done,
              onChanged: (bool? value) {
                tasksStore.changeTaskDone(index, value);
              },
            ),
            title: Text(tasksStore.tasksFiltered[index].title),
          );
        },
      );
    });
  }
}
