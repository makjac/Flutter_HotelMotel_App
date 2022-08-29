import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/firebase_options.dart';
import 'package:hotel_motel/hive.dart';
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
  setupHiveAdapters();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (context) => locator.get<AuthBloc>(),
      ),
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
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'Poopins'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.router.generateRoute,
    );
  }
}
