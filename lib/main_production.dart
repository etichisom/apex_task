
import 'package:apex_task/app.dart';
import 'package:apex_task/config/flavour_config.dart';
import 'package:apex_task/config/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig prodAppConfig = const AppConfig(
    appName: 'SmartPay',
    flavor: 'production',
    child: MyApp(),
  );
  await dotenv.load(fileName: ".env");
  setupLocator();
  ///initializing of GetStorage for caching of data
  await GetStorage.init();
  runApp(prodAppConfig);
}
