import 'package:apex_task/constant/size.dart';
import 'package:apex_task/constant/strings.dart';
import 'package:apex_task/domain/params/register_params.dart';
import 'package:apex_task/features/authentication/screen/verify_account.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/package/country_picker/contry_picker.dart';
import 'package:apex_task/res/color.dart';
import 'package:apex_task/widget/custom_appbar.dart';
import 'package:apex_task/widget/custom_button.dart';
import 'package:apex_task/widget/text_field.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:the_validator/the_validator.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  final String email;
  static const String routeName = "Register";
  const Register({Key? key, required this.email}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _userName = TextEditingController();

  final TextEditingController _country = TextEditingController();

  final TextEditingController _password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   CountryCode? code;
  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.read<AuthViewModel>();
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
                  RichText(
                    text: TextSpan(
                        text: Strings.tell,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: "\n${Strings.yourSelf}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: AppColor.solidGreen),
                          ),
                        ]),
                  ),
                  SizedBox(height: 32.h,),
                  Field(
                    hint: Strings.fullName,
                    controller: _fullName,
                    textInputType: TextInputType.text,
                    validate: FieldValidator.minLength(2),
                  ),
                  SizedBox(height: 16.h,),
                  Field(
                    hint: Strings.userName,
                    controller: _userName,
                    textInputType: TextInputType.text,
                    validate: FieldValidator.minLength(2),
                  ),
                  SizedBox(height: 16.h,),
                  Field(
                    onTap: (){
                      const KFlCountryCodePicker().showPicker(context: context).then((value){
                        if(value!=null){
                          setState(() {
                            code=value;
                          });
                          _country.text=value.name;
                        }

                      });
                    },
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                    hint: Strings.country,
                    prefixIcon: code!=null?code!.flagImage:null,
                    controller: _country,
                    enable: false,
                    textInputType: TextInputType.text,
                    validate: FieldValidator.minLength(2),
                  ),
                  SizedBox(height: 16.h,),
                  Field(
                    hint: Strings.password,
                    controller: _password,
                    obSecure: true,
                    textInputType: TextInputType.text,
                    validate: FieldValidator.password(
                        errorMessage: Strings.invalidPassword
                    ),
                  ),
                  SizedBox(height:40.h ,),
                  CustomButton(
                      text:Strings.signUp,
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                           // authViewModel.register(RegisterParam(
                           //     fullName: fullName,
                           //     username: username,
                           //     email: email,
                           //     country: country,
                           //     password: password,
                           //     deviceName: deviceName))
                        }
                        Navigator.pushNamed(context,VerifyAccount.routeName);
                      }
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
