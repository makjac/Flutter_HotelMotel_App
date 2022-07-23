import 'package:flutter/material.dart';

class TopAuthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    var firstStart = Offset(size.width * 0.11, size.height);
    var firstEnd = Offset(size.width * 0.2, size.height * 0.4);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width * 0.25, size.height * 0.1);
    var secondEnd = Offset(size.width * 0.5, size.height * 0.1);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    var thirdStart = Offset(size.width * 0.8, size.height * 0.08);
    var thirdEnd = Offset(size.width, 0);
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
