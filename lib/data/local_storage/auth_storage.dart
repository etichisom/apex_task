import 'package:apex_task/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthStorage{
 static const  String authBox = "authBox";
 static const  String pinBox = "pinBox";
 static final box = GetStorage();


 static void setPin(String pin){
  box.write(pinBox, pin);
 }

 static clear(){
  box.erase();
 }

 static String? getPin(){
  return box.read(pinBox);
 }

 static UserModel? getUser(){
  var data = box.read(authBox);
  if(data!=null){
   return UserModel.fromJson(data);
  }
  return null ;
 }



 static void saveUser(Map userData){
  box.write(authBox, userData);
 }



}