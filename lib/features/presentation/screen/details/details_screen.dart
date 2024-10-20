import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/components/app_button.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';

class DetailsScreen extends StatelessWidget {
  final SocialModel data;

  const DetailsScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppUtility.determineThemeByName(data.name);
    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // This will make the back arrow white
        ),
        backgroundColor: theme.primary,
        systemOverlayStyle: AppUtility.getSystemOverlayStyle(),
        title: Text(
          data.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: data.imgUrl,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Text(
                data.history,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: AppButton(
                color: theme.primary,
                onPressed: () {},
                text: "${AppStrings.visit} ${data.name}",
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
