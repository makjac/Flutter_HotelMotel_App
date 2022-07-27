import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/clippers/auth_bottom_clipper.dart';
import 'package:hotel_motel/widgets/clippers/auth_top_clipper.dart';

class AuthScreenShapes extends StatelessWidget {
  final Widget child;

  const AuthScreenShapes({required this.child,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: ClipPath(
            clipper: TopAuthClipper(),
            child: Container(
              height: 310,
              width: width,
              decoration: const BoxDecoration(
                  color: InsetsColors.authShapeShadowColor),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: ClipPath(
            clipper: TopAuthClipper(),
            child: Container(
              height: 250,
              width: width,
              decoration: const BoxDecoration(
                  color: InsetsColors.authShapeMainColor),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: BottomAuthClipper(),
            child: Container(
              height: 250,
              width: width,
              decoration: const BoxDecoration(
                  color: InsetsColors.authShapeMainColor),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: BottomAuthClipper(),
            child: Container(
              height: 320,
              width: width,
              decoration: const BoxDecoration(
                  color: InsetsColors.authShapeShadowColor),
            ),
          ),
        ),
        Positioned(child: child),
      ],
    );
  }
}
