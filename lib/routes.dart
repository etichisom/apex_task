
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
import 'package:go_router/go_router.dart';

import 'features/authentication/screen/login.dart';



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