import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  ///base Url of the server
  static  final String _baseUrl = dotenv.get("APP_DEV_URL", fallback: "");

 ///endpoint to register an account
  static String register ="${_baseUrl}auth/register";

  ///endpoint to login into an account
  static  String login ="${_baseUrl}auth/login";

  ///endpoint to send verification mail
  static  String sendEmail ="${_baseUrl}auth/email";

  ///endpoint to verify a user email before registration
  static  String verifyEmail ="${_baseUrl}auth/email/verify";

}