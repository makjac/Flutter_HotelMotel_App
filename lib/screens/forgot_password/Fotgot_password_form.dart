import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/TextFormFields/password_text_field.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final repeatPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          PasswordTextField(passwordController: passwordController),
          const SizedBox(height: Insets.m),
          PasswordTextField(passwordController: repeatPasswordController),
          const SizedBox(height: Insets.s),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: InsetsColors.eButBackgroundColor,
              fixedSize: const Size(200, 40),
            ),
            child: const Text(
              "New password",
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
