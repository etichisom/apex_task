
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/features/onboarding/splash_screen.dart';
import 'package:apex_task/locator.dart';
import 'package:apex_task/res/theme.dart';
import 'package:apex_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  ///initializing of GetStorage for caching of data
  await GetStorage.init();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 851),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: Splash.routeName);
        });
  }
}
