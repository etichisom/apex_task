
import 'package:apex_task/core/res/color.dart';
import 'package:flutter/material.dart';

class AppTheme{

  ///Light theme
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    brightness: Brightness.light,
    fontFamily: 'SFPRO',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      )
    )
  );




}