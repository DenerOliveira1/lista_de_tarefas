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
            builder: (context) => TaskDialogWidget(TaskStore()),
          );
        },
      ),
    );
  }
}
