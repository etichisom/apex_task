
import 'package:apex_task/core/constant/size.dart';
import 'package:apex_task/core/constant/strings.dart';
import 'package:apex_task/core/res/app_image.dart';
import 'package:apex_task/core/res/color.dart';
import 'package:apex_task/features/authentication/screen/login.dart';
import 'package:apex_task/features/authentication/screen/verify_account.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/widget/custom_appbar.dart';
import 'package:apex_task/widget/custom_button.dart';
import 'package:apex_task/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:the_validator/the_validator.dart';

// ignore: must_be_immutable
class CreateAccount extends StatelessWidget {
  static const String routeName = "/CreateAccount";
  CreateAccount({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    /// creating a instance of the viewModel class
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: Padding(
          padding:
              EdgeInsets.only(left: kAppPadding, right: kAppPadding, top: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: Strings.create,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: "${Strings.appName}\n",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: AppColor.solidGreen),
                          ),
                          TextSpan(
                            text: Strings.account,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: Colors.black),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Field(
                    hint: Strings.email,
                    controller: _email,
                    textInputType: TextInputType.text,
                    validate:
                        FieldValidator.email(message: Strings.invalidEmail),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                      appState: authViewModel.appState,
                      text: Strings.signUp,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authViewModel.sendEmail(_email.text.trim())
                          .then((value){
                            if(value!=null){
                              /// sending verification code as a notification on the app
                              /// because the backend is not sending email
                              value.addAll({"email":_email.text});
                              context.push(VerifyAccount.routeName,extra: value);
                            }
                          });
                        }
                      }),
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(AppImage.or),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 56.h,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset(AppImage.google)),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(child: Image.asset(AppImage.apple)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(Login.routeName);
                        },
                        child: RichText(
                          text: TextSpan(
                              text: Strings.haveAccount,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: AppColor.grey),
                              children: [
                                TextSpan(
                                  text: Strings.signIn,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: AppColor.solidGreen),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
