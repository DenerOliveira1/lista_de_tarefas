import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/shared.dart';
import '../../stores/stores.dart';
import './widgets/widgets.dart';

class DailyTab extends StatelessWidget {
  final TasksStore tasksStore = GetIt.I<TasksStore>();

  DailyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Observer(
              builder: (context) {
                return ExpansionTile(
                  title: const Text('Hoje'),
                  trailing: _buildCount(tasksStore.tasksToday.length),
                  children: tasksStore.tasksToday.map((e) => ListTile(title: Text(e.title),)).toList(),
                );
              }
            ),
            Observer(
              builder: (context) {
                return ExpansionTile(
                  title: const Text('Amanhã'),
                  trailing: _buildCount(tasksStore.tasksTomorrow.length),
                  children: tasksStore.tasksTomorrow.map((e) => ListTile(title: Text(e.title),)).toList(),
                );
              }
            ),
            Observer(
              builder: (context) {
                return ExpansionTile(
                  title: const Text('Semana que vem'),
                  trailing: _buildCount(tasksStore.tasksForNextWeek.length),
                  children: tasksStore.tasksForNextWeek.map((e) => ListTile(title: Text(e.title),)).toList(),
                );
              }
            ),
            Observer(
              builder: (context) {
                return ExpansionTile(
                  title: const Text('Mês que vem'),
                  trailing: _buildCount(tasksStore.tasksForNextMonth.length),
                  children: tasksStore.tasksForNextMonth.map((e) => ListTile(title: Text(e.title),)).toList(),
                );
              }
            ),
            Observer(
              builder: (context) {
                return ExpansionTile(
                  title: const Text('Ano que vem'),
                  trailing: _buildCount(tasksStore.tasksForNextYear.length),
                  children: tasksStore.tasksForNextYear.map((e) => ListTile(title: Text(e.title),)).toList(),
                );
              }
            ),
          ],
        )
      ),
    );
  }

  Widget _buildCount(int count) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25,
        ),
        border: Border.all(
          color: AppColors.boxBorderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: Text("$count"),
      ),
    );
  }
}
