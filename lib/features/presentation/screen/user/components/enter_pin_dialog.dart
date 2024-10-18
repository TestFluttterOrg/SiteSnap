import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_colors.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/features/presentation/components/app_pinput.dart';

class EnterPinDialog extends StatelessWidget {
  final Function() onEnter;
  final Function() onClose;

  const EnterPinDialog({
    super.key,
    required this.onClose,
    required this.onEnter,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        width: 255.w,
        height: 160.h,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    Text(
                      AppStrings.messageVerifyItsYou,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppStrings.messageEnterPin,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.3.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    AppPinput(
                      onTextChanged: (pinCode) {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 0.8.h,
              width: double.infinity,
              color: Colors.black26,
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: onEnter,
                      child: Container(
                        height: 40.h,
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.enter,
                          style: TextStyle(
                            color: AppColors.textGreenColor,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 0.8.h,
                  height: 40.h,
                  color: Colors.black26,
                ),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: onClose,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        child: Text(
                          AppStrings.close,
                          style: TextStyle(
                            color: AppColors.textRedColor,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
