
import 'package:apex_task/features/authentication/screen/all_set.dart';
import 'package:apex_task/features/authentication/screen/create_account.dart';
import 'package:apex_task/features/authentication/screen/pin_login.dart';
import 'package:apex_task/features/authentication/screen/register.dart';
import 'package:apex_task/features/authentication/screen/set_pin.dart';
import 'package:apex_task/features/authentication/screen/verify_account.dart';
import 'package:apex_task/features/dashboard/screens/home.dart';
import 'package:apex_task/features/onboarding/onboarding_screen.dart';
import 'package:apex_task/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/authentication/screen/login.dart';

class RouteGenerator {

   /// The class contains all the screen routes
   /// of the app.

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
      case Dashboard.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  const Dashboard());
      case SetPin.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  const SetPin());
      case AllSet.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  const AllSet());
      case PinLogin.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) =>  const PinLogin());


      default:
        MaterialPageRoute(
            settings: settings, builder: (_) => const SizedBox());
    }
    return null;
  }



}
