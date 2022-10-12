import 'package:get_it/get_it.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/bloc/category/category_bloc.dart';
import 'package:hotel_motel/bloc/hotel_thumbnail/hotel_thumbnail_bloc.dart';
import 'package:hotel_motel/data/controller/storage/storage_controller.dart';
import 'package:hotel_motel/data/controller/user/user_controller.dart';
import 'package:hotel_motel/data/repository/firebase/analitic/analitics_repository.dart';
import 'package:hotel_motel/data/repository/firebase/auth/auth_repository.dart';
import 'package:hotel_motel/data/repository/fb_firestore_repository.dart';
import 'package:hotel_motel/data/repository/firebase/storage/storage_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/category/category_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';
import 'package:hotel_motel/screens/home_screens/bookings/bloc/bookings_bloc.dart';
import 'package:hotel_motel/screens/home_screens/search/bloc/rcomended_bloc.dart';
import 'package:hotel_motel/screens/hotel_screen/bloc/hotel_page_bloc.dart';
import 'package:hotel_motel/screens/results_screens/bloc/result_search_bloc.dart';

final locator = GetIt.instance;

setupServices() {
  //repositores
  locator.registerSingleton<AuthRepository>(AuthRepository());
  locator.registerSingleton<StorageRepository>(StorageRepository());
  locator.registerSingleton<AnalyticsRepository>(AnalyticsRepository());
  locator.registerSingleton<FirestoreRepository>(FirestoreRepository());
  locator.registerSingleton<HotelRepository>(HotelRepository());
  locator.registerSingleton<RoomRepository>(RoomRepository());

  //controllers
  locator.registerSingleton<UserController>(UserController());
  locator.registerSingleton<StorageController>(StorageController());

  //blocs
  locator.registerSingleton<AuthBloc>(AuthBloc());
  locator.registerSingleton<CategoryBloc>(CategoryBloc(
    categoryRepository: CategoryRepository(),
  ));
  locator.registerSingleton<HotelThumbnailBloc>(HotelThumbnailBloc());
  locator.registerSingleton<ResultSearchBloc>(
    ResultSearchBloc(
      hotelRepository: locator.get<HotelRepository>(),
      roomRepository: locator.get<RoomRepository>(),
    ),
  );
  locator.registerSingleton<HotelPageBloc>(HotelPageBloc(
    hotelRepository: locator.get<HotelRepository>(),
    roomRepository: locator.get<RoomRepository>(),
  ));
  locator.registerSingleton<RecomendedBloc>(RecomendedBloc(
    hotelRepository: locator.get<HotelRepository>(),
    roomRepository: locator.get<RoomRepository>(),
  ));
  locator.registerSingleton<BookingsBloc>(BookingsBloc(
    hotelRepository: locator.get<HotelRepository>(),
    roomRepository: locator.get<RoomRepository>(),
  ));
}
