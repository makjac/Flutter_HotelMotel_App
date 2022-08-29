import 'package:get_it/get_it.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/data/controller/storage_controller.dart';
import 'package:hotel_motel/data/controller/user_controller.dart';
import 'package:hotel_motel/data/repository/fb_analitics_repository.dart';
import 'package:hotel_motel/data/repository/fb_auth_repository.dart';
import 'package:hotel_motel/data/repository/fb_storage_repository.dart';

final locator = GetIt.instance;

setupServices() {
  //repositores
  locator.registerSingleton<AuthRepository>(AuthRepository());
  locator.registerSingleton<StorageRepository>(StorageRepository());
  locator.registerSingleton<AnalyticsRepository>(AnalyticsRepository());

  //controllers
  locator.registerSingleton<UserController>(UserController());
  locator.registerSingleton<StorageController>(StorageController());

  //blocs
  locator.registerSingleton<AuthBloc>(AuthBloc());
}
