import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPinput extends StatefulWidget {
  final Function(String) onTextChanged;

  const AppPinput({
    super.key,
    required this.onTextChanged,
  });

  @override
  State<AppPinput> createState() => _AppPinputState();
}

class _AppPinputState extends State<AppPinput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TextWidget(value: "5"),
        SizedBox(width: 15.w),
        _TextWidget(value: "5"),
        SizedBox(width: 15.w),
        _TextWidget(value: "5"),
        SizedBox(width: 15.w),
        _TextWidget(value: "-"),
        SizedBox(width: 15.w),
        _TextWidget(value: "-"),
        SizedBox(width: 15.w),
        _TextWidget(value: "-"),
      ],
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String value;

  const _TextWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
