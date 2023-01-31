import 'package:get_it/get_it.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/bloc/hotel_thumbnail/hotel_thumbnail_bloc.dart';
import 'package:hotel_motel/bloc/review/review_bloc.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/repository/fb_firestore_repository.dart';
import 'package:hotel_motel/repository/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/repository/user_repository/user_repository.dart';
import 'package:hotel_motel/repository/review_repository/review_repository.dart';
import 'package:hotel_motel/repository/room_repository/room_repository.dart';
import 'package:hotel_motel/repository/user_details_repository/user_details_repository.dart';
import 'package:hotel_motel/service/analitics_service/analitics_service.dart';
import 'package:hotel_motel/service/auth_service/auth_service.dart';
import 'package:hotel_motel/service/storage_service/storage_service.dart';

import 'bloc/bookings/bookings_bloc.dart';
import 'bloc/hotel/hotel_page_bloc.dart';
import 'bloc/results/result_search_bloc.dart';
import 'bloc/search/rcomended_bloc.dart';

final locator = GetIt.instance;

setupServices() {
  //repositores
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<StorageService>(StorageService());
  locator.registerSingleton<FirestoreRepository>(FirestoreRepository());
  locator.registerSingleton<HotelRepository>(HotelRepository());
  locator.registerSingleton<RoomRepository>(RoomRepository());
  locator.registerSingleton<ReviewRepository>(ReviewRepository());
  locator.registerSingleton<UserRepository>(UserRepository());
  locator.registerSingleton<UserDetailsRepository>(UserDetailsRepository());

  //services
  locator.registerLazySingleton<AnaliticsService>(() => AnaliticsService());

  //controllers
  locator.registerSingleton<UserController>(UserController());

  //blocs
  locator.registerSingleton<AuthBloc>(AuthBloc());
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
  locator.registerSingleton<ReviewBloc>(ReviewBloc());
}
