
import 'package:apex_task/features/authentication/screen/create_account.dart';
import 'package:apex_task/features/authentication/screen/register.dart';
import 'package:apex_task/features/authentication/screen/verify_account.dart';
import 'package:apex_task/features/onboarding/onboarding_screen.dart';
import 'package:apex_task/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/authentication/screen/login.dart';

class RouteGenerator {

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Splash.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Splash());
      case ScreenOnBoarding.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ScreenOnBoarding());
      case Login.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  Login());
      case CreateAccount.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  CreateAccount());
      case VerifyAccount.routeName:
        Map data = settings.arguments as Map;
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  VerifyAccount(emailData: data,));
      case Register.routeName:
       String email = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings, builder: (_) =>   Register(email:email ,));


      default:
        MaterialPageRoute(
            settings: settings, builder: (_) => const SizedBox());
    }
    return null;
  }



}
