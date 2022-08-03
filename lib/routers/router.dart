import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/screens/auth_screens/auth_screens_base.dart';
import 'package:hotel_motel/screens/home_screens/home_screens_base.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.HOME_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      case AppRoute.LOGIN_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInPage());
      case AppRoute.REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpPage());
      case AppRoute.FORGPASS_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgotPasswordPage());
      default:
        return null;
    }
  }
}
