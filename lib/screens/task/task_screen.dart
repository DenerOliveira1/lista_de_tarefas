import 'package:flutter/material.dart';

import './widgets/widgets.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar taks"),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget(),
              DateWidget(),
              DoneWidget(),
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          child: const Text("Salvar"),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
