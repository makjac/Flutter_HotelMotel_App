import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_motel/firebase_options.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupServices();

  runApp(HotelMotelApp(
    router: AppRouter(),
  ));
}

class HotelMotelApp extends StatelessWidget {
  final AppRouter router;

  const HotelMotelApp({required this.router, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
