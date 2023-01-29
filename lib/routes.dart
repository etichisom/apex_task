
import 'package:apex_task/data/local_storage/auth_storage.dart';
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
import 'package:go_router/go_router.dart';

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


class AppRoute{

  static final router = GoRouter(
    initialLocation:getInitialPage(),
    // initialLocation: AuthStorage.getPin()!=null?
    // PinLogin.routeName:ScreenOnBoarding.routeName,
    routes: [
      GoRoute(
        path: Splash.routeName,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: ScreenOnBoarding.routeName,
        builder: (context, state) => const ScreenOnBoarding(),
      ),
      GoRoute(
        path: Login.routeName,
        builder: (context, state) =>  Login(),
      ),
      GoRoute(
        path: CreateAccount.routeName,
        builder: (context, state) =>  CreateAccount(),
      ),
      GoRoute(
        path: Register.routeName,
        builder: (context, state){
          final email = state.extra as String;
          return  Register(email:email??"" ,);
        },
      ),
      GoRoute(
        path: Dashboard.routeName,
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        path: Splash.routeName,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: SetPin.routeName,
        builder: (context, state) => const SetPin(),
      ),

      GoRoute(
        path: VerifyAccount.routeName,
        builder: (context, state){
          final data = state.extra as Map;
          return VerifyAccount(emailData: data,);
        }
      ),
      GoRoute(
        path: AllSet.routeName,
        builder: (context, state) => const AllSet(),
      ),
      GoRoute(
        path: PinLogin.routeName,
        builder: (context, state) => const PinLogin(),
      ),



    ],
  );

  static String getInitialPage(){
    if(AuthStorage.getPin()!=null&&AuthStorage.getUser()!=null){
      return PinLogin.routeName;
    }else{
      return ScreenOnBoarding.routeName;
    }
  }

}