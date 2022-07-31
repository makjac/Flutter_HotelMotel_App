import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/screens/forgot_password/forgot_password_page.dart';
import 'package:hotel_motel/screens/home/home_page.dart';
import 'package:hotel_motel/screens/signIn/sign_in_page.dart';
import 'package:hotel_motel/screens/signUp/sign_up_page.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.HOME_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      case AppRoute.LOGIN_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignInPage());
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
