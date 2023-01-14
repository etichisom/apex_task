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
     Navigator.pushReplacementNamed(context, ScreenOnBoarding.routeName);
    });
  }
}
