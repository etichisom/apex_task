// To parse this JSON data, do
//
//     final otpParams = otpParamsFromJson(jsonString);

import 'dart:convert';


class OtpParams {
  OtpParams({
    required this.email,
    required  this.token,
  });

  String email;
  String token;



  Map<String, dynamic> toJson() => {
    "email": email,
    "token": token,
  };
}
