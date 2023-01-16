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
      ///check if there is a user that is stored on the app and if the user has a pin
      ///if there is user on the he has a pin ,the user is navigated to the pin login screen
      ///else he is taking to the intro screen
      if(AuthStorage.getUser()!=null&&AuthStorage.getPin()!=null){
        Navigator.pushReplacementNamed(context, PinLogin.routeName);
      }else{
        Navigator.pushReplacementNamed(context, ScreenOnBoarding.routeName);
      }

    });
  }
}
