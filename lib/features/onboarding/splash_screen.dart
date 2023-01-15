import 'package:apex_task/data/local_storage/auth_storage.dart';
import 'package:apex_task/features/authentication/screen/pin_login.dart';
import 'package:apex_task/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = "/splashScreen";
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(AuthStorage.getUser()!=null&&AuthStorage.getPin()!=null){
        Navigator.pushReplacementNamed(context, PinLogin.routeName);
      }else{
        Navigator.pushReplacementNamed(context, ScreenOnBoarding.routeName);
      }

    });
  }
}
