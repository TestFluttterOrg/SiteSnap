import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_assets.dart';
import 'package:sitesnap/features/presentation/components/app_icon.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';

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
    return AppScaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 60.w,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _IconView(),
          ],
        ),
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
