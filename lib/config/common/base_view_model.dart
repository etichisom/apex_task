


import 'package:apex_task/config/enums/app_state.dart';
import 'package:flutter/material.dart';


/// all viewModel call extends the BaseViewModel to access the functions
class BaseViewModel extends ChangeNotifier {
  AppState _appState = AppState.idle;
  AppState get appState => _appState;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;


  /// the function is used to set the error message of the app on a viewModel
  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }


/// the function is used to set the the state of the app on a viewModel
  void setState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}