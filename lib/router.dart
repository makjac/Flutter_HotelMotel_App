import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/data/repository/auth_repository.dart';
import 'package:hotel_motel/screens/forgot_password/forgot_password_page.dart';
import 'package:hotel_motel/screens/signIn/sign_in_page.dart';
import 'package:hotel_motel/screens/signUp/sign_up_page.dart';

class AppRouter {
  AuthRepository? repository;

  AppRouter() {
    repository = AuthRepository();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.LOGIN_ROUTE:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignInPage(repository: repository!,));
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
