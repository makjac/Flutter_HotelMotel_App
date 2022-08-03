import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';

class HomeRouter {
  HomeRouter();

  Route? generateHomeRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.SEARCH_ROUTE:
        break;
      case AppRoute.FORGPASS_ROUTE:
        break;
      case AppRoute.BOOKING_ROUTE:
        break;
      case AppRoute.PROFILE_ROUTE:
        break;
      default:
        return null;
    }
  }
}
