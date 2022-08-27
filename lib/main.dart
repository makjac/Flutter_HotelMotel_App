import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/bloc/storage_bloc.dart';
import 'package:hotel_motel/firebase_options.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/routers/router.dart';
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
      BlocProvider(
        create: (context) => locator.get<StorageBloc>(),
      ),
    ],
    child: HotelMotelApp(
      router: AppRouter(),
    ),
  ));
}

class HotelMotelApp extends StatelessWidget {
  final AppRouter router;

  const HotelMotelApp({required this.router, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'Poopins'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
