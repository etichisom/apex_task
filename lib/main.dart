
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/features/onboarding/splash_screen.dart';
import 'package:apex_task/locator.dart';
import 'package:apex_task/res/theme.dart';
import 'package:apex_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  ///initializing of GetStorage for caching of data
  await GetStorage.init();
  runApp(
    ///wrapping the app with the provider for managing the state of the app
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthViewModel())
          ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRoute.router;
    ///ScreenUtil is used to give the app a uniform size(height,width,text size)
    return ScreenUtilInit(
        designSize: const Size(393, 851),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              // onGenerateRoute: RouteGenerator.generateRoute,
              // initialRoute: Splash.routeName
          );
        });
  }
}
