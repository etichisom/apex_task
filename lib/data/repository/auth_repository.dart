import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apex_task/config/api/api_url.dart';
import 'package:apex_task/domain/params/login_params.dart';
import 'package:apex_task/domain/params/otp_param.dart';
import 'package:apex_task/domain/params/register_params.dart';
import 'package:apex_task/domain/repository/auth_repository_interface.dart';
import 'package:apex_task/model/failure.dart';
import 'package:apex_task/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class AuthRepository extends AuthRepositoryInterface{
  ///http client
  var client = http.Client();


  ///Network call time out
  final Duration _timeout = const Duration(seconds: 10);


  @override
  Future<UserModel?> login({required LoginParam loginParam})async {
    try {
      var encodedData = jsonEncode(loginParam.toJson());
      var response = await client.post(Uri.parse(AppUrl.login),
          body: encodedData,
          headers: {
            "Content-type": "application/json",
          }).timeout(_timeout);
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(msg:data['message']??"");
      if(data['status']==true){
        return UserModel.fromJson(data);
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException catch (_) {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } catch (e) {
      throw Failure("Something went wrong. Try again");
    }
    return null;
  }

  @override
  Future<UserModel?> register({required RegisterParam registerParam}) async{
    try {
      var encodedData = jsonEncode(registerParam.toJson());
      var response = await client.post(Uri.parse(AppUrl.register),
          body: encodedData,
          headers: {
            "Content-type": "application/json",
          }).timeout(_timeout);
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(msg:data['message']??"");
      if(data['status']==true){
       return UserModel.fromJson(data);
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException catch (_) {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } catch (e) {
      throw Failure("Something went wrong. Try again");
    }
    return null;
  }



  @override
  Future<Map?> sendEmail({required String email}) async{
    try {
      var map = {"email":email};
      var encodedData = jsonEncode(map);
      var response = await client.post(Uri.parse(AppUrl.sendEmail),
          body: encodedData,
          headers: {
            "Content-type": "application/json",
          }).timeout(_timeout);
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(msg:data['message']??"");
      if(data['status']==true){
        return data;
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException catch (_) {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } catch (e) {
      throw Failure("Something went wrong. Try again");
    }
    return null;
  }

  @override
  Future<Map?> verifyAccount({required OtpParams otpParams})async {
    try {
      var encodedData = jsonEncode(otpParams.toJson());
      var response = await client.post(Uri.parse(AppUrl.verifyEmail),
          body: encodedData,
          headers: {
            "Content-type": "application/json",
          }).timeout(_timeout);
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(msg:data['message']??"");
      if(data['status']==true){
        return data;
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException catch (_) {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } catch (e) {
      throw Failure("Something went wrong. Try again");
    }
    return null;
  }

}