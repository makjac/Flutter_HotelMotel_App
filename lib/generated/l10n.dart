// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SignIn`
  String get SignInLabel {
    return Intl.message(
      'SignIn',
      name: 'SignInLabel',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get SignIn {
    return Intl.message(
      'SignIn',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get isAccountAsk {
    return Intl.message(
      'Already have an account?',
      name: 'isAccountAsk',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgotPasswdNav {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgotPasswdNav',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUpLabel {
    return Intl.message(
      'SignUp',
      name: 'SignUpLabel',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account`
  String get NoAccountAsk {
    return Intl.message(
      'Don\'t have an account',
      name: 'NoAccountAsk',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPasswdLablel {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPasswdLablel',
      desc: '',
      args: [],
    );
  }

  /// `Refresh password`
  String get ForgotPasswdBNT {
    return Intl.message(
      'Refresh password',
      name: 'ForgotPasswdBNT',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get Email {
    return Intl.message(
      'email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Passwd {
    return Intl.message(
      'Password',
      name: 'Passwd',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get RepPasswd {
    return Intl.message(
      'Repeat password',
      name: 'RepPasswd',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get SearchAppBar {
    return Intl.message(
      'Search',
      name: 'SearchAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get SearchIconLabel {
    return Intl.message(
      'Search',
      name: 'SearchIconLabel',
      desc: '',
      args: [],
    );
  }

  /// `Pick location`
  String get PickLocation {
    return Intl.message(
      'Pick location',
      name: 'PickLocation',
      desc: '',
      args: [],
    );
  }

  /// `Pick date`
  String get PickDate {
    return Intl.message(
      'Pick date',
      name: 'PickDate',
      desc: '',
      args: [],
    );
  }

  /// `room`
  String get Room {
    return Intl.message(
      'room',
      name: 'Room',
      desc: '',
      args: [],
    );
  }

  /// `rooms`
  String get Rooms {
    return Intl.message(
      'rooms',
      name: 'Rooms',
      desc: '',
      args: [],
    );
  }

  /// `adult`
  String get Adult {
    return Intl.message(
      'adult',
      name: 'Adult',
      desc: '',
      args: [],
    );
  }

  /// `adults`
  String get Adults {
    return Intl.message(
      'adults',
      name: 'Adults',
      desc: '',
      args: [],
    );
  }

  /// `Kid`
  String get Kid {
    return Intl.message(
      'Kid',
      name: 'Kid',
      desc: '',
      args: [],
    );
  }

  /// `Kids`
  String get Kids {
    return Intl.message(
      'Kids',
      name: 'Kids',
      desc: '',
      args: [],
    );
  }

  /// `Recomended`
  String get RecomendedLabel {
    return Intl.message(
      'Recomended',
      name: 'RecomendedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search again`
  String get SearchAgainLabel {
    return Intl.message(
      'Search again',
      name: 'SearchAgainLabel',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get FavoriteAppBar {
    return Intl.message(
      'Favorite',
      name: 'FavoriteAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get FavoriteIconLabel {
    return Intl.message(
      'Saved',
      name: 'FavoriteIconLabel',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get BookingsAppBar {
    return Intl.message(
      'Bookings',
      name: 'BookingsAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Booked`
  String get BookingsIconLabel {
    return Intl.message(
      'Booked',
      name: 'BookingsIconLabel',
      desc: '',
      args: [],
    );
  }

  /// `Hi, `
  String get ProfileAppBar_hi {
    return Intl.message(
      'Hi, ',
      name: 'ProfileAppBar_hi',
      desc: '',
      args: [],
    );
  }

  /// `nice to see you!`
  String get ProfileAppBar_ntsy {
    return Intl.message(
      'nice to see you!',
      name: 'ProfileAppBar_ntsy',
      desc: '',
      args: [],
    );
  }

  /// `Trips`
  String get TripScoreLabel {
    return Intl.message(
      'Trips',
      name: 'TripScoreLabel',
      desc: '',
      args: [],
    );
  }

  /// `Register own hotel`
  String get RegisterHotelBNTLabel {
    return Intl.message(
      'Register own hotel',
      name: 'RegisterHotelBNTLabel',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
