// To parse this JSON data, do
//
//     final loginParam = loginParamFromJson(jsonString);

import 'dart:convert';

class LoginParam {
  LoginParam({
  required  this.email,
  required  this.password,
    this.deviceName = "mobile",
  });

  String email;
  String password;
  String deviceName;



  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "device_name": deviceName,
  };
}
