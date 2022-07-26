import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/widgets/decorations/auth_screen_shapes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 231, 139, 0),
          shadowColor: Colors.transparent,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 243, 215),
        body: const AuthScreenShapes(child: Center(child: SignInForm(),),),
      ),
    );
  }
}
