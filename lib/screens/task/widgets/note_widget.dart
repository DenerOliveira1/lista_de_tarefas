import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../stores/stores.dart';

class NoteWidget extends StatelessWidget {
  final TaskStore taskStore;

  const NoteWidget(this.taskStore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextFormField(
          initialValue: taskStore.note,
          onChanged: taskStore.setNote,
          decoration: InputDecoration(
            hintText: AppStrings.taskFormFieldNoteHintText.tr(),
            labelText: AppStrings.taskFormFieldNote.tr(),
            errorText: taskStore.noteError?.tr(),
          ),
        );
      },
    );
  }
}
