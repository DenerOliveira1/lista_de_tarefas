import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/shared.dart';
import '../../../stores/stores.dart';

class AddTaskWidget extends StatelessWidget {
  final TaskStore taskStore;
  final PageViewStore pageViewStore = GetIt.I<PageViewStore>();

  AddTaskWidget(this.taskStore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: taskStore.observerKey,
      color: AppColors.backgroundColor,
      child: TextField(
        autofocus: true,
        onChanged: taskStore.setTitle,
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
          //pageViewStore.scaffoldKey.currentState?.dispose();
        },
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
    );
  }
}
