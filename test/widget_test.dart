
import 'package:apex_task/features/authentication/screen/login.dart';
import 'package:apex_task/features/authentication/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apex_task/main_production.dart' as app;
import 'package:provider/provider.dart';

void main() async{

  testWidgets('login test', (WidgetTester tester)async{

    ///find widget needed  to be tested
    final emailField = find.byKey(const ValueKey('key'));
    final passwordField = find.byKey(const ValueKey('password'));
    final button = find.byKey(const ValueKey('login'));

    ///pump the screen/ui to be tested
    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel())
        ],
        child: MaterialApp(home: Login(),)));

    ///execute the test
   // tester.enterText(emailField, "chisometi@gmail.com");
   // tester.enterText(passwordField, "masterkeys");
    tester.tap(emailField);
    await tester.pump();
  });
}