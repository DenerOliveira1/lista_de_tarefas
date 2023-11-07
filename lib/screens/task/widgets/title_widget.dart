import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return TextFormField();
      },
    );
  }
}
