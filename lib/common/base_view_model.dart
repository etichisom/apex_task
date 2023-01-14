

import 'package:apex_task/enums/app_state.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  AppState _appState = AppState.idle;
  AppState get appState => _appState;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void setErrorMessage(String msg) {
    _errorMessage = msg;
    notifyListeners();
  }

  void setState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}