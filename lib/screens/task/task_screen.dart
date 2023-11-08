import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../shared/shared.dart';
import '../../stores/stores.dart';
import './widgets/widgets.dart';

class TaskScreen extends StatefulWidget {
  final String task;

  const TaskScreen({required this.task, super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskStore taskStore = TaskStore();
  final List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    super.initState();

    if (widget.task.trim().isNotEmpty) {
      taskStore.loadTask(widget.task);
    }

    disposers.add(
      reaction<bool>(
        (r) => !taskStore.loading && taskStore.error.isNotEmpty,
        (v) {
          if (v) {
            SnackBar snackBar = SnackBar(
              content: Text(
                taskStore.error.tr(),
                textAlign: TextAlign.center,
              ),
              backgroundColor: AppColors.snackBarBackgroundErrorColor,
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          return;
        },
      ),
    );

    disposers.add(
      when(
        (_) => !taskStore.loading && taskStore.success.isNotEmpty,
        () {
          SnackBar snackBar = SnackBar(
            content: Text(
              taskStore.success.tr(),
              textAlign: TextAlign.center,
            ),
            backgroundColor: AppColors.snackBarBackgroundSuccessColor,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var dispose in disposers) {
      dispose();
    }

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
                NoteWidget(taskStore),
                //DateWidget(taskStore),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Observer(builder: (context) {
          return ElevatedButton(
            onPressed: taskStore.savePressed,
            child: Text(AppStrings.buttonSave.tr()),
          );
        }),
      ),
    );
  }
}
