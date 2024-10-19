import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/constants/app_assets.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/routes/app_routes.dart';
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/presentation/components/app_button.dart';
import 'package:sitesnap/features/presentation/components/app_dialog.dart';
import 'package:sitesnap/features/presentation/components/app_icon.dart';
import 'package:sitesnap/features/presentation/components/app_input.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';
import 'package:sitesnap/features/presentation/screen/user/bloc/user_state.dart';
import 'package:sitesnap/features/presentation/screen/user/components/enter_pin_dialog.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.vf<UserBloc>()),
      ],
      child: const _UserForm(),
    );
  }
}

class _UserForm extends StatelessWidget {
  const _UserForm();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      child: AppScaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 60.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _IconView(),
              SizedBox(height: 100.h),
              const _InputView(),
              SizedBox(height: 10.h),
              const _ButtonView(),
            ],
          ),
        ),
      ),
      listenWhen: (prev, current) => prev.event != current.event,
      listener: (context, state) {
        final event = state.event;
        switch (event) {
          case UserUIEvent.showEnterCode:
            showEnterCodeDialog(context);
            break;
          case UserUIEvent.goToNextPage:
            goToNextPage(context);
            break;
          case UserUIEvent.hideDialog:
            AppDialog.dismiss(context);
            break;
          default:
            break;
        }
      },
    );
  }

  void showEnterCodeDialog(BuildContext context) {
    final bloc = context.read<UserBloc>();
    AppDialog.custom(
      context,
      barrierDismissible: false,
      child: EnterPinDialog(
        onClose: () {
          AppDialog.dismiss(context);
        },
        onEnter: (data) {
          bloc.verifyCode(data);
        },
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    final state = context.read<UserBloc>().state;
    final username = state.username;
    final code = state.code;
    context.pushReplacement(
      AppRoutes.process,
      extra: ProcessParamModel(
        username: username,
        code: code,
        processType: ProcessType.login,
      ),
    );
  }
}

class _IconView extends StatelessWidget {
  const _IconView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 120.h,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: AppIcon(iconString: AppAssets.youtube),
          ),
          Align(
            alignment: Alignment.center,
            child: AppIcon(iconString: AppAssets.spotify),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: AppIcon(iconString: AppAssets.facebook),
          ),
        ],
      ),
    );
  }
}

class _InputView extends StatelessWidget {
  const _InputView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (prev, current) => prev.errorMessage != current.errorMessage,
      builder: (context, state) {
        return AppInput(
          hintText: AppStrings.username,
          errorMessage: state.errorMessage,
          onTextChanged: bloc.filterEnteredText,
        );
      },
    );
  }
}

class _ButtonView extends StatelessWidget {
  const _ButtonView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (prev, current) => prev.isButtonEnable != current.isButtonEnable,
      builder: (context, state) {
        return AppButton(
          isDisabled: !state.isButtonEnable,
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            bloc.onEnterPress();
          },
          text: AppStrings.enter,
        );
      },
    );
  }
}
