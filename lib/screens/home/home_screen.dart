import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../screens/screens.dart';
import '../../stores/stores.dart';

class HomeScreen extends StatelessWidget {
  final TasksStore tasksStore = GetIt.I<TasksStore>();
  final PageViewStore pageViewStore = GetIt.I<PageViewStore>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: pageViewStore.scaffoldKey,
      body: PageView(
        controller: pageViewStore.pageController,
        children: [
          DailyTab(),
          CalendarTab(),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: pageViewStore.currentIndex,
            onTap: pageViewStore.setCurrentScreen,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: "Tarefas",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: "Calendário",
              ),
            ],
          );
        }
      ),
    );
  }
}
