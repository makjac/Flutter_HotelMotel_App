import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/forgot_password/fotgot_password_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      body: AuthScreenTemplate(
          header: "Forgot Password", form: ForgotPasswordForm()),
    );
  }
}
