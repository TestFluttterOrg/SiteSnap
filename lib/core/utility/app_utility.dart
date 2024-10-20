import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sitesnap/features/domain/model/theme_model.dart';

class AppUtility {
  AppUtility._();

  static bool isAlphanumeric(String input) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumeric.hasMatch(input);
  }

  static ThemeModel determineThemeByName(String name) {
    switch (name.toLowerCase()) {
      case "youtube":
        return const ThemeModel(
          primary: Color(0xffF44336),
          secondary: Color(0xffD32F2F),
        );
      case "spotify":
        return const ThemeModel(
          primary: Color(0xff4CAF50),
          secondary: Color(0xff388E3C),
        );
      case "facebook":
        return const ThemeModel(
          primary: Color(0xff2196F3),
          secondary: Color(0xff1976D2),
        );
      default:
        return const ThemeModel(
          primary: Color(0xffFFEB3B),
          secondary: Color(0xffFBC02D),
        );
    }
  }
}
