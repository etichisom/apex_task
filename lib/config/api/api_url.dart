class AppUrl {
  ///base Url of the server
  static const String _baseUrl = "http://146.190.74.11/api/v1/";

 ///endpoint to register an account
  static const String register ="${_baseUrl}auth/register";

  ///endpoint to login into an account
  static const String login ="${_baseUrl}auth/login";

  ///endpoint to send verification mail
  static const String sendEmail ="${_baseUrl}auth/email";

  ///endpoint to verify a user email before registration
  static const String verifyEmail ="${_baseUrl}auth/email/verify";

}