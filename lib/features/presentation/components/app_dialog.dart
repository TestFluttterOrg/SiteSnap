import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDialog {
  AppDialog._();

  static bool isOpen = false;

  static Future<void> custom(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
    Function? whenComplete,
  }) {
    dismiss(context);
    isOpen = true;

    return showDialog<dynamic>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (barrierDismissible) {
              dismiss(context);
            }
          },
          child: Container(
            color: Colors.black12,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13.r),
                child: child,
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      isOpen = false;
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static void dismiss(BuildContext context) {
    if (isOpen) {
      context.pop();
    }
  }
}
