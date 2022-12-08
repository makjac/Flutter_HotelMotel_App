import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/bloc/category/category_bloc.dart';
import 'package:hotel_motel/bloc/hotel_thumbnail/hotel_thumbnail_bloc.dart';
import 'package:hotel_motel/bloc/review/review_bloc.dart';
import 'package:hotel_motel/firebase_options.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/routers/router.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/bloc/finalize_booking_bloc.dart';
import 'package:hotel_motel/screens/home_screens/bookings/bloc/bookings_bloc.dart';
import 'package:hotel_motel/screens/home_screens/search/bloc/rcomended_bloc.dart';
import 'package:hotel_motel/screens/hotel_screen/bloc/hotel_page_bloc.dart';
import 'package:hotel_motel/screens/results_screens/bloc/result_search_bloc.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await HomeShared.init();

  setupServices();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => locator.get<AuthBloc>(),
      ),
      BlocProvider<CategoryBloc>(
          create: (context) => locator.get<CategoryBloc>()),
      BlocProvider<HotelThumbnailBloc>(
          create: (context) =>
              locator.get<HotelThumbnailBloc>()..add(LoadThumbnails())),
      BlocProvider<ResultSearchBloc>(
        create: (context) => locator.get<ResultSearchBloc>(),
      ),
      BlocProvider<HotelPageBloc>(
        create: (context) => locator.get<HotelPageBloc>(),
      ),
      BlocProvider<RecomendedBloc>(
        create: (context) =>
            locator.get<RecomendedBloc>()..add(LoadRecommendation()),
      ),
      BlocProvider<BookingsBloc>(
        create: (context) => locator.get<BookingsBloc>(),
      ),
      BlocProvider<ReviewBloc>(
        create: (context) => locator.get<ReviewBloc>(),
      ),
      BlocProvider<FinalizeBookingBloc>(
          create: (context) => FinalizeBookingBloc()),
    ],
    child: HotelMotelApp(
      router: AppRouter(),
    ),
  ));
}

class HotelMotelApp extends StatefulWidget {
  final AppRouter router;

  const HotelMotelApp({required this.router, Key? key}) : super(key: key);

  @override
  State<HotelMotelApp> createState() => _HotelMotelAppState();
}

class _HotelMotelAppState extends State<HotelMotelApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'Poopins'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.router.generateRoute,
    );
  }
}
