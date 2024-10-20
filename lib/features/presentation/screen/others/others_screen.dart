import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/presentation/components/app_button.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';
import 'package:sitesnap/core/di/dependency_injection.dart' as di;
import 'package:sitesnap/features/presentation/screen/others/%20bloc/others_bloc.dart';
import 'package:sitesnap/features/presentation/screen/others/%20bloc/others_state.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.vf<OthersBloc>()..initialize()),
      ],
      child: const _OthersForm(),
    );
  }
}

class _OthersForm extends StatelessWidget {
  const _OthersForm();

  @override
  Widget build(BuildContext context) {
    final theme = AppUtility.determineThemeByName(AppStrings.others);
    final primaryColor = theme.primary;
    return AppScaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black45,
        iconTheme: const IconThemeData(
          color: Colors.white, // This will make the back arrow white
        ),
        backgroundColor: primaryColor,
        systemOverlayStyle: AppUtility.getSystemOverlayStyle(),
        title: Text(
          AppStrings.others,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            AppStrings.messageYouMightAlsoLike,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 20.h),
          const _CarouselView(),
          SizedBox(height: 10.h),
          const _LabelView(),
          SizedBox(height: 20.h),
          _VisitButtonView(color: primaryColor),
        ],
      ),
    );
  }
}

class _CarouselView extends StatelessWidget {
  const _CarouselView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OthersBloc>();
    return BlocBuilder<OthersBloc, OthersState>(
      buildWhen: (prev, current) => prev.reloadBrands != current.reloadBrands,
      builder: (context, state) {
        final brands = bloc.brands;
        if (brands.isNotEmpty) {
          return CarouselSlider.builder(
            itemCount: brands.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return SizedBox(
                height: 250.h,
                width: 350.w,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                    child: Image.asset(
                      brands[itemIndex].image,
                      fit: BoxFit.contain,
                    ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 0.8,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
              onPageChanged: (pageIndex, __) {
                bloc.onPageChange(pageIndex);
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _LabelView extends StatelessWidget {
  const _LabelView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OthersBloc, OthersState>(
      buildWhen: (prev, current) => prev.currentBrand != current.currentBrand,
      builder: (context, state) {
        final data = state.currentBrand;
        if (data != null) {
          return Text(
            data.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          );
        }
        return const Placeholder();
      },
    );
  }
}

class _VisitButtonView extends StatelessWidget {
  final Color color;

  const _VisitButtonView({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OthersBloc, OthersState>(
      buildWhen: (prev, current) => prev.currentBrand != current.currentBrand,
      builder: (context, state) {
        final data = state.currentBrand;
        if (data != null) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: AppButton(
              color: color,
              onPressed: () {
                AppUtility.launchWebUrl(data.webUrl);
              },
              text: "${AppStrings.visit} ${data.name} ${AppStrings.website}",
            ),
          );
        }
        return const Placeholder();
      },
    );
  }
}
