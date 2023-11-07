import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import './shared/routes.dart';
import './stores/stores.dart';

void main() {
  _setupStores();

  runApp(
    const MyApp(),
  );
}

void _setupStores() {
  GetIt.I.registerSingleton(TasksStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lista de tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: routers,
    );
  }
}
