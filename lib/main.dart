import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_motel/firebase_options.dart';
import 'package:hotel_motel/screens/signIn/sign_in_page.dart';
import 'package:hotel_motel/widgets/clippers/auth_top_clipper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HotelMotelApp());
}

class HotelMotelApp extends StatefulWidget {
  const HotelMotelApp({Key? key}) : super(key: key);

  @override
  State<HotelMotelApp> createState() => _HotelMotelAppState();
}

class _HotelMotelAppState extends State<HotelMotelApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "HotelMotel",
      home: SignInPage(),
    );
  }
}
