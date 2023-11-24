import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_de_tarefas/stores/stores.dart';

import '../../../shared/shared.dart';

class TaskDialogWidget extends StatelessWidget {
  final TaskStore taskStore;

  const TaskDialogWidget(this.taskStore, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: taskStore.observerKey,
      title: Text(taskStore.index != null ? "Edit task" : "Add task", style: Theme.of(context).textTheme.titleLarge,),
      content: TextFormField(
        autofocus: true,
        onChanged: taskStore.setTitle,
        initialValue: taskStore.title,
        decoration: InputDecoration(
          suffixIcon: Observer(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: taskStore.selectDateTime ? AppColors.iconColor : AppColors.disabledColor,
                ),
                onPressed: taskStore.selectDateTimePressed,
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancelar"),
        ),
        Observer(
            builder: (context) {
              return TextButton(
                onPressed: taskStore.savePressed,
                child: Text(taskStore.index != null ? "Atualizar" : "Adicionar"),
              );
            }
        ),
      ],
    );
  }
}
