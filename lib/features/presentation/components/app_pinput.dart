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

  final FocusNode _textFieldFocusNode = FocusNode();
  String label1 = "-";
  String label2 = "-";
  String label3 = "-";
  String label4 = "-";
  String label5 = "-";
  String label6 = "-";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_textFieldFocusNode);
    });
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void filterEnteredText(String val) {
    switch(val.length) {
      case 0:
        setState(() {
          label1 = "-";
          label2 = "-";
          label3 = "-";
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 1:
        setState(() {
          label1 = val[0].toString();
          label2 = "-";
          label3 = "-";
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 2:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = "-";
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 3:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 4:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = val[3].toString();
          label5 = "-";
          label6 = "-";
        });
        break;
      case 5:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = val[3].toString();
          label5 = val[4].toString();
          label6 = "-";
        });
        break;
      case 6:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = val[3].toString();
          label5 = val[4].toString();
          label6 = val[5].toString();
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_textFieldFocusNode);
      },
      child: Stack(
        children: [
          Opacity(
            opacity: 0,
            child: SizedBox(
              width: double.infinity,
              height: 35.h,
              child: TextField(
                maxLength: 6,
                maxLines: 1,
                focusNode: _textFieldFocusNode,
                keyboardType: TextInputType.number,
                onChanged: filterEnteredText,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TextWidget(value: label1),
              SizedBox(width: 15.w),
              _TextWidget(value: label2),
              SizedBox(width: 15.w),
              _TextWidget(value: label3),
              SizedBox(width: 15.w),
              _TextWidget(value: label4),
              SizedBox(width: 15.w),
              _TextWidget(value: label5),
              SizedBox(width: 15.w),
              _TextWidget(value: label6),
            ],
          ),
        ],
      ),
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
