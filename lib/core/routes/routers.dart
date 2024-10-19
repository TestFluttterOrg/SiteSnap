import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/presentation/screen/process/process_screen.dart';
import 'package:sitesnap/features/presentation/screen/user/user_screen.dart';

class Routes {
  Routes._();

  static final routers = GoRouter(
    initialLocation: AppRoutes.user,
    routes: [
      //User
      GoRoute(
        path: AppRoutes.user,
        name: AppRoutes.user,
        builder: (_, __) {
          return const UserScreen();
        },
      ),
      //Processing Screen
      GoRoute(
        path: AppRoutes.process,
        name: AppRoutes.process,
        builder: (_, __) {
          return const ProcessScreen();
        }
      ),
    ],
  );
}
