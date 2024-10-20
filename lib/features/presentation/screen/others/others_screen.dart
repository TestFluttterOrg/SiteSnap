import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/core/utility/app_utility.dart';
import 'package:sitesnap/features/domain/model/social_model.dart';
import 'package:sitesnap/features/presentation/components/app_scaffold.dart';

class OthersScreen extends StatelessWidget {

  const OthersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _OthersForm();
  }
}

class _OthersForm extends StatelessWidget {
  const _OthersForm();

  @override
  Widget build(BuildContext context) {
    final theme = AppUtility.determineThemeByName(AppStrings.others);
    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //elevation: 10,
        //shadowColor: Colors.black45,
        iconTheme: const IconThemeData(
          color: Colors.white, // This will make the back arrow white
        ),
        backgroundColor: theme.primary,
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
      body: Container(),
    );
  }
}
