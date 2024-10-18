import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/presentation/screen/user/user_screen.dart';

class Routes {
  Routes._();

  static final routers = GoRouter(
    initialLocation: AppRoutes.user,
    routes: [
      //USer
      GoRoute(
        path: AppRoutes.user,
        name: AppRoutes.user,
        builder: (_, __) {
          return const UserScreen();
        },
      ),
    ],
  );
}
