import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/TextFormFields/email_text_field.dart';
import 'package:hotel_motel/widgets/TextFormFields/password_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final repeatPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextField(emailController: emailController),
          const SizedBox(height: Insets.s),
          PasswordTextField(passwordController: passwordController),
          const SizedBox(height: Insets.s),
          PasswordTextField(passwordController: repeatPasswordController),
          const SizedBox(height: Insets.s),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: InsetsColors.eButBackgroundColor,
              fixedSize: const Size(200, 40),
            ),
            child: const Text(
              "Sign up",
              style: TextStyle(
                color: InsetsColors.eButTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
