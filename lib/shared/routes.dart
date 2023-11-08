import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';
import './shared.dart';

final GoRouter routers = GoRouter(
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: AppStrings.homeRouteName,
      path: AppStrings.homeRoutePath,
      builder: (BuildContext context, GoRouterState state) {
        return SafeArea(
          child: HomeScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppStrings.taskRouteName,
          path: AppStrings.taskRoutePath,
          builder: (BuildContext context, GoRouterState state) {
            return TaskScreen(
              task: state.pathParameters['task']!,
            );
          },
        ),
      ],
    ),
  ],
);
