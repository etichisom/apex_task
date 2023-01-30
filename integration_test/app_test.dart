
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:apex_task/main_production.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('login',
            (tester) async {
         await app.main();
          await tester.pumpAndSettle();

          ///find widget needed  to be tested
          final emailField = find.byKey(const ValueKey('key'));
          final passwordField = find.byKey(const ValueKey('password'));
          final button = find.byKey(const ValueKey('login'));
          final getStarted = find.byKey(const ValueKey('press'));


         await tester.tap(getStarted);
         await  tester.enterText(emailField, "chisometi@gmail.com");
         await tester.enterText(passwordField, "masterkeys");
         await tester.tap(button);

          // Trigger a frame.
          await tester.pumpAndSettle();

        });
  });
}