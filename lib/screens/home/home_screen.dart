import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import './widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.taskList.tr()),
      ),
      body: Column(
        children: [
          CalendarWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go(AppStrings.goTaskRoute),
      ),
    );
  }
}
