import 'package:flutter/material.dart';

class BottomAuthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(size.width, 0);

    var firstStart = Offset(size.width * 0.93, 0);
    var firstEnd = Offset(size.width * 0.82, size.height * 0.43);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width * 0.7, size.height * 0.9);
    var secondEnd = Offset(size.width * 0.2, size.height * 0.9);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    var thirdStart = Offset(size.width * 0.1, size.height * 0.92);
    var thirdEnd = Offset(size.width * 0.05, size.height);

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

// path.lineTo(0, size.height);

//     var firstStart = Offset(size.width * 0.11, size.height);
//     var firstEnd = Offset(size.width * 0.2, size.height * 0.4);
//     path.quadraticBezierTo(
//         firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

//     var secondStart = Offset(size.width * 0.25, size.height * 0.1);
//     var secondEnd = Offset(size.width * 0.5, size.height * 0.1);
//     path.quadraticBezierTo(
//         secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

//     var thirdStart = Offset(size.width * 0.8, size.height * 0.08);
//     var thirdEnd = Offset(size.width, 0);
//     path.quadraticBezierTo(
//         thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

//     path.close();