

import 'package:apex_task/config/flavour_config.dart';
import 'package:apex_task/core/res/theme.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:apex_task/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRoute.router;
    print( AppConfig.of(context)!.appName);
    ///ScreenUtil is used to give the app a uniform size(height,width,text size)
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel())
      ],
      child: ScreenUtilInit(
          designSize: const Size(393, 851),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: AppConfig.of(context)!.appName,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              // onGenerateRoute: RouteGenerator.generateRoute,
              // initialRoute: Splash.routeName
            );
          }),
    );
  }
}
