import 'package:flutter/material.dart';
import 'package:hotel_motel/routers/home_router.dart';
import 'package:hotel_motel/routers/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final HomeRouter router = HomeRouter();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: router.generateHomeRoute,
      ),
    ));
  }
}
