import 'package:apex_task/domain/params/login_params.dart';
import 'package:apex_task/domain/params/otp_param.dart';
import 'package:apex_task/domain/params/register_params.dart';
import 'package:apex_task/model/user_model.dart';

abstract class AuthRepositoryInterface{

  Future<UserModel?> register({
   required RegisterParam registerParam
  });

  Future<UserModel?> login({
    required LoginParam loginParam
  });

  Future<Map?> verifyAccount({
    required OtpParams otpParams
  });

  Future<Map?> sendEmail({
    required String email
  });

}