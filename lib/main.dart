import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_constants.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/routes/routers.dart';
import 'core/di/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: ThemeData(
            fontFamily: AppConstants.appFont,
          ),
          routerConfig: Routes.routers,
        );
      },
    );
  }
}
