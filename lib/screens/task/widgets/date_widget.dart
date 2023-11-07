import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextFormField();
      },
    );
  }
}
