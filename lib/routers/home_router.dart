import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/screens/home_screens/home_screens_base.dart';

class HomeRouter {
  HomeRouter();

  Route? generateHomeRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.SEARCH_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchPage());
      case AppRoute.FAVORITE_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FavoritePage());
      case AppRoute.BOOKING_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BookingsPage());
      case AppRoute.PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfilePage());
      default:
        return null;
    }
  }
}
