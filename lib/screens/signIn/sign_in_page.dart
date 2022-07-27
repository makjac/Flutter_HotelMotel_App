import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/decorations/auth_screen_shapes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Sign In"),
        //   centerTitle: true,
        //   backgroundColor: const Color.fromARGB(255, 231, 139, 0),
        //   shadowColor: Colors.transparent,
        // ),
        backgroundColor: InsetsColors.backgroundColor,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: height,
              minWidth: width,
            ),
            child: AuthScreenShapes(
              child: Column(
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: InsetsColors.authHeaderTextColor,
                    ),
                  ),
                  const SizedBox(height: Insets.s),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: InsetsColors.authBackgroundFormColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 5, color: InsetsColors.authBorderFormColor),
                    ),
                    child: SizedBox(
                      width: width * 0.6,
                      child: const SignInForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
