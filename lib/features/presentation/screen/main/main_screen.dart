import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/presentation/components/app_dialog.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';
import 'package:sitesnap/features/presentation/screen/home/home_screen.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_bloc.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_state.dart';
import 'package:sitesnap/features/presentation/screen/process/process_screen.dart';
import 'package:sitesnap/features/presentation/screen/user/user_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return BlocListener<MainBloc, MainState>(
      child: AppScaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: AppUtility.getSystemOverlayStyle(),
        ),
        backgroundColor: Colors.white,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            UserScreen(),
            ProcessScreen(),
            HomeScreen(),
          ],
        ),
      ),
      listenWhen: (prev, current) => prev.event != current.event,
      listener: (context, state) {
        final event = state.event;
        switch (event) {
          case MainUIEvent.goToUserPage:
            pageController.animateToPage(0, duration: const Duration(milliseconds: 800), curve: Curves.ease);
            break;
          case MainUIEvent.goToProcessPage:
            pageController.animateToPage(1, duration: const Duration(milliseconds: 800), curve: Curves.ease);
            break;
          case MainUIEvent.goToProcessPageNoAnim:
            pageController.jumpToPage(1);
            break;
          case MainUIEvent.goToHomePage:
            pageController.animateToPage(2, duration: const Duration(milliseconds: 800), curve: Curves.ease);
            break;
          case MainUIEvent.showErrorDialog:
            final message = state.errorMessage;
            AppDialog.error(context, message: message);
            break;
          default:
            break;
        }
      },
    );
  }
}
