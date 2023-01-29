



import 'package:apex_task/core/constant/strings.dart';

class TextValidator{


  static String? isValidUrl(String? e){
    bool isURLValid = Uri.parse(e.toString()).host.isNotEmpty;
    if(!isURLValid){
      return "Invalid url";
    }
    return null;
  }




  static String? minLength(String? e,{required int length,String errorMessage="below minimum length"}){
    if(length>e!.length){
      return errorMessage;
    }
    return null;
  }




  static bool isEmail(String? e){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(e.toString());
  }




  static String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.toString().isEmpty) {
      return "Enter a valid password";
    } else {
      if (!regex.hasMatch(value.toString())) {
        return Strings.invalidPassword;
      } else {
        return null;
      }
    }
  }



}