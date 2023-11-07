import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';
import './shared.dart';

final GoRouter routers = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Strings.homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const SafeArea(
          child: HomeScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: Strings.taskRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const TaskScreen();
          },
        ),
      ],
    ),
  ],
);
