import 'package:apex_task/constant/size.dart';
import 'package:apex_task/constant/strings.dart';
import 'package:apex_task/data/local_storage/auth_storage.dart';
import 'package:apex_task/domain/params/login_params.dart';
import 'package:apex_task/features/authentication/screen/create_account.dart';
import 'package:apex_task/features/authentication/screen/set_pin.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/features/dashboard/screens/home.dart';
import 'package:apex_task/res/app_image.dart';
import 'package:apex_task/res/color.dart';
import 'package:apex_task/res/text_stlye.dart';
import 'package:apex_task/utils/text_validator.dart';
import 'package:apex_task/widget/custom_appbar.dart';
import 'package:apex_task/widget/custom_button.dart';
import 'package:apex_task/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:the_validator/the_validator.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  static const String routeName = "/loginScreen";
   Login({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ///creating a instance of the viewModel class
  AuthViewModel authViewModel = context.watch<AuthViewModel>();
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: Padding(
          padding:  EdgeInsets.only(
            left: kAppPadding,
            right: kAppPadding,
            top: 20.h

          ),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.welcome,
                  style: AppTextTheme.h1,),
                  SizedBox(height: 8.h,),
                  Text(Strings.welcomeBack,
                    style: AppTextTheme.light.copyWith(
                      fontSize: 16.sp
                    ),),
                  SizedBox(height: 32.h,),
                  Field(
                    key: const Key('email'),
                    hint: Strings.email,
                    controller: _email,
                    textInputType: TextInputType.text,
                    validate: FieldValidator.email(
                        message: Strings.invalidEmail
                    ),
                  ),
                  SizedBox(height:16.h ,),
                  Field(
                    key: const Key('password'),
                    hint: Strings.password,
                    controller: _password,
                    obSecure: true,
                    textInputType: TextInputType.text,
                    validate: TextValidator.validatePassword,
                  ),
                  SizedBox(height:24.h ,),
                  Text(Strings.forgotPassword,
                    style: AppTextTheme.h1.copyWith(
                      fontSize: 16.sp,
                      color: AppColor.solidGreen
                    ),),
                  SizedBox(height:42.h ,),
                  CustomButton(
                      key: const Key('login'),
                      text:Strings.signIn,
                      appState: authViewModel.appState,
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          ///login in the user using the login logic on the AuthViewModel
                          authViewModel.login(LoginParam(
                              email: _email.text,
                              password: _password.text
                          )).then((value){
                            if(value!=null){
                              ///if the user has a pin he is navigated the the home page , if he does not have a pin he is
                              ///navigated to the set pin page
                              if(AuthStorage.getPin()!=null){
                                context.go(Dashboard.routeName);
                              }else{
                                context.push(SetPin.routeName);
                              }
                            }
                          });
                        }
                      }
                  ),
                  SizedBox(height:40.h ,),
                  Image.asset(AppImage.or),
                  SizedBox(height:40.h ,),
                  SizedBox(
                    height: 56.h,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset(AppImage.google)),
                        SizedBox(width: 20.w,),
                        Expanded(child: Image.asset(AppImage.apple)),
                      ],
                    ),
                  ),
                  SizedBox(height:size.height*0.1 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push( CreateAccount.routeName);
                        },
                        child: RichText(
                          text:  TextSpan(
                              text: Strings.doNotHaveAccount,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: AppColor.grey),
                              children: [
                                TextSpan(
                                  text: Strings.signUp,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: AppColor.solidGreen
                                  ),
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
