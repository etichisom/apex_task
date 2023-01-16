
import 'package:apex_task/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;
///this function setup our classes for dependency injection "Singleton pattern"
void setupLocator(){
  locator.registerLazySingleton(() => AuthRepository());


}