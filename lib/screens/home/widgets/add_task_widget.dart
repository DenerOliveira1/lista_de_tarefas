import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../stores/stores.dart';

class AddTaskWidget extends StatelessWidget {
  final TaskStore taskStore = TaskStore();

  AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: taskStore.observerKey,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Observer(
          builder: (context) {
            return TextFormField(
              autofocus: true,
              initialValue: taskStore.title,
              onChanged: taskStore.setTitle,
              decoration: InputDecoration(
                hintText: AppStrings.taskFormFieldTitleHintText.tr(),
                //labelText: AppStrings.taskFormFieldTitle.tr(),
                //errorText: taskStore.titleError?.tr(),
                suffixIcon: Observer(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: taskStore.savePressed,
                    );
                  }
                )
              ),
            );
          },
        ),
      ),
    );
  }
}
