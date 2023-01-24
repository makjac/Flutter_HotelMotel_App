import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/bloc/hotel_thumbnail/hotel_thumbnail_bloc.dart';
import 'package:hotel_motel/bloc/review/review_bloc.dart';
import 'package:hotel_motel/firebase_options.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/routers/router.dart';
import 'package:hotel_motel/screens/auth_screens/signIn/sign_in_page.dart';
import 'package:hotel_motel/service/analitics_service/analitics_service.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';

import 'bloc/bookings/bookings_bloc.dart';
import 'bloc/finalize_booking/finalize_booking_bloc.dart';
import 'bloc/hotel/hotel_page_bloc.dart';
import 'bloc/results/result_search_bloc.dart';
import 'bloc/search/rcomended_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await HomeShared.init();

  setupServices();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => locator.get<AuthBloc>(),
        ),
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
    ),
  );
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
      navigatorObservers: [
        locator<AnaliticsService>().getAnalyticsObserver(),
      ],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.router.generateRoute,
      home: SignInPage(),
    );
  }
}
