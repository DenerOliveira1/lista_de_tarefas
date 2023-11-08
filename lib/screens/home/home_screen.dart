import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/shared.dart';
import '../../stores/stores.dart';
import './widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final TasksStore tasksStore = GetIt.I<TasksStore>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.taskList.tr()),
      ),
      body: Column(
        children: [CalendarWidget(tasksStore), TasksWidget(tasksStore)],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.goNamed(
          AppStrings.taskRouteName,
          pathParameters: {
            'task': ' ', /// Resolvido por enquanto colocando um espaço, analisar melhor
          },
        ),
      ),
    );
  }
}
