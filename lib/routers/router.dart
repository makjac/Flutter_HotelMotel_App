import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/data/models/booking_thumbnail_model.dart';
import 'package:hotel_motel/data/models/search_cryteria.dart';
import 'package:hotel_motel/screens/add_review_screen/add_review_page.dart';
import 'package:hotel_motel/screens/auth_screens/auth_screens_base.dart';
import 'package:hotel_motel/screens/booking_screen/booking_page.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/finalize_booking_page.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/utils/finalize_booking_arguments.dart';
import 'package:hotel_motel/screens/home_screens/home_screens_base.dart';
import 'package:hotel_motel/screens/hotel_screen/hotel_page.dart';
import 'package:hotel_motel/screens/results_screens/utils/hotel_home_nav_argument.dart';
import 'package:hotel_motel/screens/results_screens/results_page.dart';

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
      case AppRoute.RESULTS_ROUTE:
        final sreenArguments = settings.arguments as SearchCryteria;
        return MaterialPageRoute(
            builder: (BuildContext context) => ResultsPage(
                  searchCryteria: sreenArguments,
                ));
      case AppRoute.HOTEL_ROUTE:
        final pageArguments = settings.arguments as hotelPageArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => HotelPage(
                  hotelArguments: pageArguments,
                ));
      case AppRoute.FINALIZE_ROUTE:
        final finalizeBookingArguments =
            settings.arguments as FinalizeBookingArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => FinalizeBookingPage(
                  arguments: finalizeBookingArguments,
                ));
      case AppRoute.BOOKING_ROUTE:
        final bookingArguments = settings.arguments as BookingThumbnailModel;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              BookingPage(details: bookingArguments),
        );
      case AppRoute.ADD_REVIEW_ROUTE:
        final reviewArguments = settings.arguments as BookingThumbnailModel;
        return MaterialPageRoute(
            builder: (BuildContext context) => AddReviewPage(
                  bookingDetails: reviewArguments,
                ));
      default:
        return null;
    }
  }
}
