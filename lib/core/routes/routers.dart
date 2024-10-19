import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/presentation/screen/main/main_screen.dart';

class Routes {
  Routes._();

  static final routers = GoRouter(
    initialLocation: AppRoutes.main,
    routes: [
      //Main
      GoRoute(
        path: AppRoutes.main,
        name: AppRoutes.main,
        builder: (_, __) {
          return const MainScreen();
        },
      ),
    ],
  );
}
