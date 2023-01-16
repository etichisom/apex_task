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


 /// Logic for registering a user to the app
  Future<UserModel?> register(RegisterParam registerParam)async{
    try{
      /// tell the Ui that the app is currently making an api call so i can render a loading screen
      setState(AppState.busy);
      /// tells the service class to register the user and sends the users Information to the backend
      UserModel? response = await _authRepository.register(registerParam: registerParam);
      if(response!=null){
        _userModel =response;
        /// cache the user information locally
        AuthStorage.saveUser(response.toJson());
      }
      notifyListeners();
      /// tell the Ui that the app is no longer making and api call and we should remove the loader
      setState(AppState.idle);
      AuthStorage.clear();
      return response;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;

  }



  /// Logic for sign into a user to the app
  Future<UserModel?> login(LoginParam loginParam)async{
    try{
      /// tell the Ui that the app is currently making an api call so i can render a loading screen
      setState(AppState.busy);
      /// tells the service class to login the user and sends the users Information to the backend
      UserModel? response = await _authRepository.login(loginParam: loginParam);
      /// tell the Ui that the app is no longer making and api call and we should remove the loader
      setState(AppState.idle);
      if(response !=null){
        _userModel =response;
        /// cache the user information locally
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


  /// Logic for verifying a user to the app
  Future<Map?> verifyAccount(OtpParams otpParams)async{
    try{
      /// tell the Ui that the app is currently making an api call so i can render a loading screen
      setState(AppState.busy);
      /// tells the service class to verify the user the user and sends the users Information to the backend
      Map? response = await _authRepository.verifyAccount(otpParams: otpParams);
      /// tell the Ui that the app is no longer making and api call and we should remove the loader
      setState(AppState.idle);
      return response;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;

  }


  /// Logic for setting  a user pin on  the app
  Future<bool?> setPin(String pin)async{
    try{

      setState(AppState.busy);
      /// Setting the pin locally because there is no endpoint to set pin , so the pin is stored locally
      AuthStorage.setPin(pin);
      /// tell the Ui that the app is no longer making and api call and we should remove the loader
      setState(AppState.idle);
      return true;
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }


  /// Logic for pin Login
  Future<UserModel?> pinLogin(String pin)async{
    try{
      setState(AppState.busy);
      /// checking if the pin the user entered matches the pin that was set on the device
      if(pin==AuthStorage.getPin()){
        /// if the pin matches we set the "_userModel" containing the users data to the userdata was cached locally cache
        _userModel=AuthStorage.getUser();
        setState(AppState.idle);
        return _userModel;
      }else{
        setState(AppState.idle);
        Fluttertoast.showToast(msg: "Incorrect Pin");
      }
    }catch(e){
      setState(AppState.idle);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }

  /// Logic for sending verification mails to the users mail
  Future<Map<String ,dynamic>?> sendEmail(String email)async{
    try{
      setState(AppState.busy);
      /// tells the service class to send email to the user that wants to create an account
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