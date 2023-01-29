

import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final String flavor;

  const AppConfig({
    super.key,
    required this.appName,
    required this.flavor,
    required super.child
  }) ;

  static AppConfig? of(BuildContext context){

    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}