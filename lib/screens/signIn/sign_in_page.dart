import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';
import 'package:hotel_motel/widgets/decorations/auth_screen_shapes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      body: AuthScreenTemplate(header: "Sign In", form: SignInForm()),
    );
  }
}
