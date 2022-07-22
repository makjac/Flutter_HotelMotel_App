import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_motel/firebase_options.dart';

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
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HotelMotel"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("data"),
        ),
      ),
    );
  }
}
