import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_constants.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/routes/routers.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_bloc.dart';
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

    //Set to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(AppUtility.getSystemOverlayStyle());

    return MultiBlocProvider(
      providers: [
        //Global Bloc
        BlocProvider(create: (_) => di.vf<MainBloc>()),
      ],
      child: ScreenUtilInit(
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
      ),
    );
  }
}
