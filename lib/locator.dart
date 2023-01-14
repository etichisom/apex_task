
import 'package:apex_task/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => AuthRepository());


}