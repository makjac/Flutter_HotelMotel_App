import 'package:get_it/get_it.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/data/controller/user_controller.dart';
import 'package:hotel_motel/data/repository/fb_auth_repository.dart';

final locator = GetIt.instance;

setupServices() {
  //repositores
  locator.registerSingleton<AuthRepository>(AuthRepository());

  //controllers
  locator.registerSingleton<UserController>(UserController());

  //blocs
  locator.registerSingleton<AuthBloc>(
      AuthBloc(repository: locator.get<AuthRepository>()));
}
