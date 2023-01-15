import 'package:apex_task/constant/size.dart';
import 'package:apex_task/constant/strings.dart';
import 'package:apex_task/domain/params/otp_param.dart';
import 'package:apex_task/features/authentication/screen/register.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/res/color.dart';
import 'package:apex_task/res/text_stlye.dart';
import 'package:apex_task/widget/custom_appbar.dart';
import 'package:apex_task/widget/custom_button.dart';
import 'package:apex_task/widget/otp_timer.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class VerifyAccount extends StatefulWidget {
  final Map emailData;
  static const String routeName = "VerifyAccount";
  const VerifyAccount({Key? key, required this.emailData}) : super(key: key);

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {

  String code ='';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //    sendOtp(context);
        //   }
        // ),
        appBar: const CustomAppbar(),
        body: Padding(
          padding:  EdgeInsets.only(
              left: kAppPadding,
              right: kAppPadding,
              top: 20.h

          ),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Strings.verifyAccount,
                  style: AppTextTheme.h1,),
                SizedBox(height: 12.h,),
                RichText(
                  text: TextSpan(
                      text: "",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: Colors.black),
                      //We send a code to ( *****@mail.com )
                      children: [
                        TextSpan(
                          text: "We send a code to (",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                          ),
                        ),
                        TextSpan(
                          text: widget.emailData['email'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: "). Enter it here to verify your identity",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.black),
                        )
                      ]),
                ),
                SizedBox(height: 32.h,),
              OtpPinField(
                fieldHeight: 56,
                 fieldWidth: size.width*0.143,
                 maxLength: 5,
                  onSubmit: (e){
                   //verify(e, context);
                  },
                  onChange: (e){
                  setState(() {
                    code=e;
                  });

                  },
                  otpPinFieldStyle: OtpPinFieldStyle(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    ),
                    activeFieldBorderColor: AppColor.green,
                    defaultFieldBackgroundColor: AppColor.whiteGrey,
                    defaultFieldBorderColor: Colors.transparent,
                    fieldBorderRadius: 0,
                    fieldBorderWidth: 12
                  ),
                  otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
              ),
               SizedBox(height: 32.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpTimer(
                        onTap: (){
                          sendOtp(context);
                        }
                    ),
                  ],
                ),
                SizedBox(height:67.h ,),
                code.length!=5?
                const CustomButton(
                    text:Strings.signUp,
                    onPressed: null
                )
              :CustomButton(
                    appState: authViewModel.appState,
                    text:Strings.signUp,
                    onPressed: (){
                      verify(code,context);
                    }
                ),
                SizedBox(height:40.h ,),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void verify(String e,BuildContext context) {
    AuthViewModel authViewModel = context.read<AuthViewModel>();
    if(e.length==5){
      authViewModel.verifyAccount(OtpParams(
          email:widget.emailData['email'],
          token: e
      )).then((value){
        if(value!=null){
          Navigator.pushReplacementNamed(context, Register.routeName,arguments:widget.emailData['email'] );
        }
      });
    }else{
      Fluttertoast.showToast(msg: "Enter Otp");
    }
  }

  sendOtp(BuildContext context){
    var code = widget.emailData['data']['token'];
    CherryToast(
        icon: Icons.message,
        themeColor: Colors.green,
        title: Text(code,
          style:const TextStyle(
              fontSize:24 ,
              fontWeight: FontWeight.w700
          ),),
        displayTitle:  true,
        toastDuration: const Duration(seconds:  30),
        description:   const Text("Here is your verification Code \nps: backend not sending emails .",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13
          ),),
        animationDuration: const Duration(milliseconds:  1000),
        autoDismiss:  false)
        .show(context);
    Fluttertoast.showToast(msg: code,toastLength:Toast.LENGTH_LONG );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sendOtp(context);
    });

  }
}
