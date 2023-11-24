import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/stores.dart';
import './widgets/widgets.dart';

class CalendarTab extends StatelessWidget {
  final PageViewStore pageViewStore = GetIt.I<PageViewStore>();

  CalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalendarWidget(),
            TasksWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TaskStore taskStore = TaskStore();

              return AlertDialog(
                title: Text("Add task", style: Theme.of(context).textTheme.titleLarge,),
                content: AddTaskWidget(taskStore),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancelar"),
                  ),
                  Observer(
                    builder: (context) {
                      return TextButton(
                        onPressed: taskStore.savePressed,
                        child: Text("Adicionar"),
                      );
                    }
                  ),
                ],
              );
            },
          );
          /*pageViewStore.scaffoldKey.currentState?.showBottomSheet<void>((context) {
            return AddTaskWidget();
          });*/
        },
      ),
    );
  }
}
