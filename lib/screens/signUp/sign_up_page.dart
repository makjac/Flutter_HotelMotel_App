import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/signUp/sign_up_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      body: AuthScreenTemplate(header: "Sign up", form: SignUpForm()),
    );
  }
}
