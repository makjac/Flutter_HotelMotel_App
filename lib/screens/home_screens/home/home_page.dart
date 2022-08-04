import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/routers/home_router.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/bottom_navigator_bar/bnb_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final HomeRouter router = HomeRouter();
  int _currentIndex = 0;

  void _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState!.pushReplacementNamed(AppRoute.SEARCH_ROUTE);
        break;
      case 1:
        _navigatorKey.currentState!
            .pushNamedAndRemoveUntil(AppRoute.FAVORITE_ROUTE, (route) => false);
        break;
      case 2:
        _navigatorKey.currentState!
            .pushReplacementNamed(AppRoute.BOOKING_ROUTE);
        break;
      case 3:
        _navigatorKey.currentState!
            .pushReplacementNamed(AppRoute.PROFILE_ROUTE);
        break;
      default:
        break;
    }
    setState(() {
      _currentIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: router.generateHomeRoute,
      ),
      bottomNavigationBar:
          BNBHome(currentTabIndex: _currentIndex, onTap: _onTap),
    ));
  }
}
