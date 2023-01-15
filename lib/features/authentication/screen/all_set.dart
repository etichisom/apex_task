import 'package:apex_task/constant/strings.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/features/dashboard/screens/home.dart';
import 'package:apex_task/res/app_image.dart';
import 'package:apex_task/res/text_stlye.dart';
import 'package:apex_task/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AllSet extends StatelessWidget {
  static const String routeName = " AllSet";
  const AllSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Image.asset(AppImage.allSet),
            SizedBox(height: 32.h,),
            Text(
              "${Strings.congratulate} ${authViewModel.userModel!.data!.user!.username}",
              style: AppTextTheme.h1,),
            SizedBox(height: 12.h,),
            Text(Strings.congratulateText,
              style: AppTextTheme.light.copyWith(
                  fontSize: 16.sp
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h,),
            CustomButton(
                text: Strings.getStarted,
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, Dashboard.routeName, (route) => false);
                }
            )
          ],
        ),
      ),
    );
  }
}
