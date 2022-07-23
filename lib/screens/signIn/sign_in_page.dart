import 'package:flutter/material.dart';
import 'package:hotel_motel/widgets/clippers/auth_bottom_clipper.dart';
import 'package:hotel_motel/widgets/clippers/auth_top_clipper.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 243, 215),
        body: Stack(
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
                      color: Color.fromARGB(100, 231, 139, 0)),
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
                      color: Color.fromARGB(255, 231, 139, 0)),
                ),
              ),
            ),
            const Center(
              child: Text("hello"),
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
                      color: Color.fromARGB(255, 210, 126, 0)),
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
                      color: Color.fromARGB(100, 210, 126, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
