import 'package:get_storage/get_storage.dart';

class AuthStorage{
 static const  String authBox = "authBox";
 static const  String pinBox = "pinBox";
 static final box = GetStorage();


 static void setPin(String pin){
  box.write(pinBox, pin);
 }

 static String? getPin(){
  return box.read(pinBox);
 }


 static void saveUser(Map userData){
  box.write(authBox, userData);
 }



}