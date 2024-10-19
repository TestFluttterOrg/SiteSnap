import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sitesnap/core/constants/app_assets.dart';
import 'package:sitesnap/core/constants/app_colors.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/domain/model/process_param_model.dart';
import 'package:sitesnap/features/presentation/screen/home/bloc/home_bloc.dart';
import 'package:sitesnap/features/presentation/screen/home/bloc/home_state.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_bloc.dart';
import 'package:sitesnap/features/presentation/screen/main/bloc/main_state.dart';
import 'package:sitesnap/features/presentation/screen/process/bloc/process_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.vf<HomeBloc>()),
      ],
      child: const _HomeForm(),
    );
  }
}

class _HomeForm extends StatelessWidget {
  const _HomeForm();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      child: Column(
        children: [
          const _PageActionListener(),
          const _UserHeaderView(),
          SizedBox(height: 30.h),
          const _IconView(),
        ],
      ),
      listenWhen: (prev, current) => prev.event != current.event,
      listener: (context, state) {},
    );
  }
}

class _UserHeaderView extends StatelessWidget {
  const _UserHeaderView();

  void _showActions(BuildContext context) {
    final bloc = context.read<MainBloc>();
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  context.pop();
                  bloc.goToProcessPage(const ProcessParamModel(processType: ProcessType.logout));
                },
                child: Container(
                  height: 20.h,
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.logout,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textRedColor,
                    ),
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                context.pop();
              },
              child: Container(
                height: 20.h,
                alignment: Alignment.center,
                child: Text(
                  AppStrings.cancel,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.textBlueColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, current) => prev.userData != current.userData,
      builder: (context, state) {
        final userData = state.userData;
        return InkWell(
          onTap: () {
            _showActions(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: const CircleAvatar(),
                ),
                SizedBox(width: 13.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.username,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      userData.userCode,
                      style: TextStyle(
                        color: AppColors.textGrayColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _IconView extends StatelessWidget {
  const _IconView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, current) => prev.reloadIconList != current.reloadIconList,
      builder: (context, state) {
        final list = context.read<HomeBloc>().socialList;
        return Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              mainAxisSpacing: 60.h, // Spacing between rows
              crossAxisSpacing: 50.w, // Spacing between columns
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedNetworkImage(
                  imageUrl: list[index].iconUrl,
                  width: 50.h,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _PageActionListener extends StatelessWidget {
  const _PageActionListener();

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final mainBloc = context.read<MainBloc>();

    // This will listen to the main bloc in order to know when to initialize this current screen.
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (prev, current) => prev.pageType != current.pageType,
      builder: (context, state) {
        if (state.pageType == MainPageType.home) {
          final list = mainBloc.socialList;
          homeBloc.initialize(list);
        }
        return const SizedBox();
      },
    );
  }
}
