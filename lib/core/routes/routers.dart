import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/screen/home/home_screen.dart';
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
        builder: (_, state) {
          final data = state.extra as ProcessParamModel;
          return ProcessScreen(data: data);
        },
      ),
      //Home
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (_, state) {
          final data = state.extra as List<SocialModel>;
          return HomeScreen(data: data);
        },
      ),
    ],
  );
}
