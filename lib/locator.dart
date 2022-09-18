import 'package:get_it/get_it.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/bloc/category/category_bloc.dart';
import 'package:hotel_motel/bloc/hotel_thumbnail/hotel_thumbnail_bloc.dart';
import 'package:hotel_motel/data/controller/storage_controller.dart';
import 'package:hotel_motel/data/controller/user_controller.dart';
import 'package:hotel_motel/data/repository/firebase/analitic/analitics_repository.dart';
import 'package:hotel_motel/data/repository/firebase/auth/auth_repository.dart';
import 'package:hotel_motel/data/repository/fb_firestore_repository.dart';
import 'package:hotel_motel/data/repository/firebase/storage/storage_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/category/category_repository.dart';
import 'package:hotel_motel/screens/results_screens/bloc/result_search_bloc.dart';

final locator = GetIt.instance;

setupServices() {
  //repositores
  locator.registerSingleton<AuthRepository>(AuthRepository());
  locator.registerSingleton<StorageRepository>(StorageRepository());
  locator.registerSingleton<AnalyticsRepository>(AnalyticsRepository());
  locator.registerSingleton<FirestoreRepository>(FirestoreRepository());

  //controllers
  locator.registerSingleton<UserController>(UserController());
  locator.registerSingleton<StorageController>(StorageController());

  //blocs
  locator.registerSingleton<AuthBloc>(AuthBloc());
  locator.registerSingleton<CategoryBloc>(CategoryBloc(
    categoryRepository: CategoryRepository(),
  ));
  locator.registerSingleton<HotelThumbnailBloc>(HotelThumbnailBloc());
  locator.registerSingleton<ResultSearchBloc>(ResultSearchBloc());
}
