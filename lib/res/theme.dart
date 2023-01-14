import 'package:apex_task/res/color.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    brightness: Brightness.light,
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