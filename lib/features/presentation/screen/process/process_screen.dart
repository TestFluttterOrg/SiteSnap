import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/core/routes/routers.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/presentation/screen/process/bloc/process_state.dart';

class ProcessScreen extends StatelessWidget {
  final ProcessParamModel data;

  const ProcessScreen({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.vf<ProcessBloc>()..initialize(data)),
      ],
      child: const _ProcessForm(),
    );
  }
}

class _ProcessForm extends StatelessWidget {
  const _ProcessForm();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ProcessBloc, ProcessState>(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
          switch(event) {
            case ProcessUIEvent.goToHomeScreen:
              final data = state.otherParam as List<SocialModel>;
              _goToHomeScreen(context, data);
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  void _goToHomeScreen(BuildContext context, List<SocialModel> data) {
    context.pushReplacement(AppRoutes.home, extra: data);
  }
}
