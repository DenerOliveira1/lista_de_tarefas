import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../../stores/stores.dart';
import './widgets/widgets.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskStore taskStore = TaskStore();


  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appBarAddTask.tr()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                TitleWidget(taskStore),
                DateWidget(taskStore),
                DoneWidget(taskStore),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          child: Text(AppStrings.buttonSave.tr()),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
