import 'package:apex_task/common/base_view_model.dart';
import 'package:apex_task/data/local_storage/auth_storage.dart';
import 'package:apex_task/data/repository/auth_repository.dart';
import 'package:apex_task/domain/params/login_params.dart';
import 'package:apex_task/domain/params/otp_param.dart';
import 'package:apex_task/domain/params/register_params.dart';
import 'package:apex_task/enums/app_state.dart';
import 'package:apex_task/locator.dart';
import 'package:apex_task/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthViewModel extends BaseViewModel{
  final AuthRepository _authRepository = locator<AuthRepository>();
  UserModel? _userModel ;
  UserModel? get userModel =>_userModel;



  Future<UserModel?> register(RegisterParam registerParam)async{
    try{
      setState(AppState.busy);
      UserModel? response = await _authRepository.register(registerParam: registerParam);
      _userModel =userModel;
      notifyListeners();
      setState(AppState.idle);
      return response;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;

  }




  Future<UserModel?> login(LoginParam loginParam)async{
    try{
      setState(AppState.busy);
      UserModel? response = await _authRepository.login(loginParam: loginParam);
      setState(AppState.idle);
      if(response !=null){
        _userModel =response;
        AuthStorage.saveUser(response.toJson());
        notifyListeners();
      }
      return response;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;

  }



  Future<Map?> verifyAccount(OtpParams otpParams)async{
    try{
      setState(AppState.busy);
      Map? response = await _authRepository.verifyAccount(otpParams: otpParams);
      setState(AppState.idle);
      return response;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;

  }

  Future<bool?> setPin(String pin)async{
    try{
      setState(AppState.busy);
      AuthStorage.setPin(pin);
      setState(AppState.idle);
      return true;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }


  Future<Map<String ,dynamic>?> sendEmail(String email)async{
    try{
      setState(AppState.busy);
      Map? response = await _authRepository.sendEmail(email: email);
      setState(AppState.idle);
      return response as Map<String ,dynamic>;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;

  }


}