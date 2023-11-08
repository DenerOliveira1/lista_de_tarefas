import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../stores/stores.dart';

class DateWidget extends StatelessWidget {
  final TaskStore taskStore;

  const DateWidget(this.taskStore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextFormField();
      },
    );
  }
}
