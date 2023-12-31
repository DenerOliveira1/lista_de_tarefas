import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/stores.dart';

class CalendarWidget extends StatelessWidget {
  final TasksStore tasksStore = GetIt.I<TasksStore>();

  CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TableCalendar(
          focusedDay: tasksStore.dateSelected,
          currentDay: tasksStore.dateSelected,
          firstDay: DateTime.now().subtract(const Duration(days: 365)),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          onDaySelected: tasksStore.changeDate,
        );
      },
    );
  }
}
