import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/screen/details/details_screen.dart';
import 'package:sitesnap/features/presentation/screen/main/main_screen.dart';
import 'package:sitesnap/features/presentation/screen/webview/webview_screen.dart';

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
      //Details
      GoRoute(
        path: AppRoutes.details,
        name: AppRoutes.details,
        builder: (_, state) {
          final data = state.extra as SocialModel;
          return DetailsScreen(data: data);
        },
      ),
      //WebView
      GoRoute(
        path: AppRoutes.webView,
        name: AppRoutes.webView,
        builder: (_, state) {
          final data = state.extra as SocialModel;
          return WebViewScreen(data: data);
        },
      ),
    ],
  );
}
