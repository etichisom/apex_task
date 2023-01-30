

import 'package:apex_task/core/constant/strings.dart';
import 'package:apex_task/core/res/app_image.dart';
import 'package:apex_task/core/res/color.dart';
import 'package:apex_task/core/res/text_stlye.dart';
import 'package:apex_task/data/model/model_onboarding_data.dart';
import 'package:apex_task/features/authentication/screen/login.dart';
import 'package:apex_task/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ScreenOnBoarding extends StatefulWidget {
  static const String routeName = "/onboardingScreen";
  const ScreenOnBoarding({Key? key}) : super(key: key);

  @override
  State<ScreenOnBoarding> createState() => _ScreenOnBoardingState();
}

class _ScreenOnBoardingState extends State<ScreenOnBoarding> {
  final List<OnboardingData> list = [
   OnboardingData(
       backgroundImagePath:AppImage.onboardingBackground1,
       imagePath: AppImage.onboarding1,
       title: Strings.onboardingTitle1,
       desc: Strings.onboardingSubTitle1
   ),

    OnboardingData(
        backgroundImagePath:AppImage.onboardingBackground2,
        imagePath: AppImage.onboarding2,
        title: Strings.onboardingTitle2,
        desc: Strings.onboardingSubTitle2
    ),

  ];


  int index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                goToLogin(context);
              },
              child:  Text(Strings.skip,
              style: AppTextTheme.h3.copyWith(
                color: AppColor.green,
                fontWeight: FontWeight.w600
              ),))
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 30.w, right: 30.w),
        child: Column(
          children: [
            SizedBox(height: 70.h,),
            Expanded(
              flex: 3,
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (i) {
                    index = i;
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var data = list[index];
                    return Column(
                      children: [
                        //Flexible(child: Container()),
                        Expanded(
                          flex: 5,
                          child: Image.asset(data.imagePath),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          data.title,
                          style: AppTextTheme.h1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          data.desc,
                          style: AppTextTheme.light,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(height: 30.h,),
            Column(
              children: [
                SmoothPageIndicator(
                    controller: controller, // PageController
                    count: list.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColor.primaryColor,
                      dotHeight: 8,
                      radius: 8,
                      dotWidth: 8,
                    ), // your preferred effect
                    onDotClicked: (index) {}),
                SizedBox(height: 30.h,),
                CustomButton(
                  key: const Key('getStarted'),
                  text: Strings.getStarted,
                  textColor: Colors.white,
                  onPressed: () {

                    goToLogin(context);

                  },
                ),
                // Flexible(child: Container()),
              ],
            ),
            SizedBox(height: 60.h,)
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context){
    context.go(Login.routeName);
  }
}
