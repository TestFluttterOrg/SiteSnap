import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/components/app_dialog.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_bloc.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_state.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/presentation/screen/process/bloc/process_state.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.vf<ProcessBloc>()),
      ],
      child: const _ProcessForm(),
    );
  }
}

class _ProcessForm extends StatelessWidget {
  const _ProcessForm();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProcessBloc, ProcessState>(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _PageActionListener(),
          const CupertinoActivityIndicator(),
          SizedBox(height: 10.h),
          BlocBuilder<ProcessBloc, ProcessState>(
            builder: (context, state) {
              var message = "";
              final processType = state.processType;
              switch (processType) {
                case ProcessType.login:
                  message = AppStrings.messageLoggingIn;
                  break;
                case ProcessType.logout:
                  message = AppStrings.messageLoggingOut;
                  break;
                case ProcessType.fetch:
                  message = AppStrings.messageFetchingData;
                  break;
                default:
                  break;
              }
              return Text(
                message,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              );
            },
          ),
        ],
      ),
      listenWhen: (prev, current) => prev.event != current.event,
      listener: (BuildContext context, ProcessState state) {
        final event = state.event;
        final errorMessage = state.errorMessage;
        switch (event) {
          case ProcessUIEvent.goToHomeScreen:
            final data = state.otherParam as List<SocialModel>;
            _goToHomeScreen(context, data);
            break;
          case ProcessUIEvent.goToUserScreenFromLoginFailure:
            _goToUserScreenAndShowErrorDialog(context, errorMessage);
            break;
          case ProcessUIEvent.fetchFailed:
            _showFetchDataFailed(context, errorMessage);
            break;
          default:
            break;
        }
      },
    );
  }

  void _goToHomeScreen(BuildContext context, List<SocialModel> data) {
    context.read<MainBloc>().goToHomePage(data);
  }

  void _goToUserScreenAndShowErrorDialog(BuildContext context, String message) {
    final bloc = context.read<MainBloc>();
    bloc.goToUserPage();
    bloc.showErrorMessage(message);
  }

  void _showFetchDataFailed(BuildContext context, String message) {
    final bloc = context.read<ProcessBloc>();
    final mainBloc = context.read<MainBloc>();
    AppDialog.confirm(
      context,
      message: message,
      title: AppStrings.error,
      confirmText: AppStrings.retry,
      onConfirm: () {
        AppDialog.dismiss(context);
        bloc.performDataFetch();
      },
      onCancel: () {
        AppDialog.dismiss(context);
        mainBloc.goToUserPage();
      },
    );
  }
}

class _PageActionListener extends StatelessWidget {
  const _PageActionListener();

  @override
  Widget build(BuildContext context) {
    final processBloc = context.read<ProcessBloc>();

    // This will listen to the main bloc in order to know when to initialize this current screen.
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (prev, current) => prev.pageType != current.pageType,
      builder: (context, state) {
        if (state.pageType == MainPageType.process) {
          final data = state.processData ?? const ProcessParamModel();
          processBloc.initialize(data);
        }
        return const SizedBox();
      },
    );
  }
}
