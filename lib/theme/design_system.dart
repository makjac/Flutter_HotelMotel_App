import 'package:flutter/material.dart';

class Insets {
  static const double xs = 8.0;
  static const double s = 16.0;
  static const double m = 24.0;
  static const double l = 32.0;
  static const double xl = 40.0;
  static const double xxl = 48.0;
}

class InsetsColors {
  //main colors
  static const Color backgroundColor = Color.fromARGB(255, 255, 243, 215);

  //auth screens
  static const Color authShapeMainColor = Color.fromARGB(255, 231, 139, 0);
  static const Color authShapeShadowColor = Color.fromARGB(100, 231, 139, 0);
  static const Color authBorderFormColor = Color.fromARGB(150, 119, 74, 0);
  static const Color authBackgroundFormColor =
      Color.fromARGB(160, 255, 238, 206);
  static const Color authHeaderTextColor = Color.fromARGB(255, 96, 61, 0);

  //BottomNavigationBar
  static const Color BNBBackgroundColor = Colors.brown;
  static const Color BNBSelectedItemColor = Colors.blue;
  static const Color BNBUnselectedItemColor = Colors.white;

  //TextFormField
  static const Color tffFillColor = Color.fromARGB(150, 255, 245, 228);
  static const Color tffBorderColor = Colors.brown;

  //ElevatedButton
  static const Color eButBackgroundColor = Color.fromARGB(255, 119, 74, 0);
  static const Color eButTextColor = Color.fromARGB(255, 253, 244, 225);

  //TextButton
  static const Color tButColor = Color.fromARGB(255, 176, 111, 0);

  //CircularProgressIndicator
  static const Color cpiColor = Colors.brown;
}
