import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:apex_task/main_production.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          ///find widget needed  to be tested
          final emailField = find.byKey(const ValueKey('key'));
          final passwordField = find.byKey(const ValueKey('password'));
          final button = find.byKey(const ValueKey('login'));

          // Emulate a tap on the floating action button.
          tester.enterText(emailField, "chisometi@gmail.com");
          tester.enterText(passwordField, "masterkeys");
          tester.tap(button);

          // Trigger a frame.
          await tester.pumpAndSettle();

        });
  });
}