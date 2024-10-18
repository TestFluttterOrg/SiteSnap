import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/presentation/screen/user/bloc/user_bloc.dart';
import 'package:sitesnap/main.dart';

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
          horizontal: 20.w,
        ),
        child: Column(
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
    return Stack(
      children: [

      ],
    );
  }
}

