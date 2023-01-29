
import 'package:apex_task/config/enums/app_state.dart';
import 'package:apex_task/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height, width, textSize, borderRadius;
  final Color color, textColor;
  final Function()? onPressed;
  final FontWeight fontWeight;
  final AppState appState;
  const CustomButton ({
        required this.text,
        required this.onPressed,
        this.height = 56,
        this.color = AppColor.primaryColor,
        this.width = double.maxFinite,
        this.borderRadius = 15,
        this.textColor = Colors.white,
        this.textSize = 16,
        this.fontWeight = FontWeight.w700,
        this.appState = AppState.idle,
        Key? key,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        key: key,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
        onPressed:appState==AppState.idle?onPressed:null,
        child: appState==AppState.busy?const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          ),
        ):Text(
          text,
          style: TextStyle(
            fontSize: textSize.sp,
            fontWeight: fontWeight,
            color: textColor,
          ),

        ),
      ),
    );
  }
}
