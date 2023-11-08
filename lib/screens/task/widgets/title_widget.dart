import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../stores/stores.dart';

class TitleWidget extends StatelessWidget {
  final TaskStore taskStore;

  const TitleWidget(this.taskStore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextFormField(
          initialValue: taskStore.title,
          onChanged: taskStore.setTitle,
          decoration: InputDecoration(
            hintText: AppStrings.taskFormFieldTitleHintText.tr(),
            labelText: AppStrings.taskFormFieldTitle.tr(),
            errorText: taskStore.titleError?.tr(),
          ),
        );
      },
    );
  }
}
