import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final passwdController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: loginController,
            decoration: const InputDecoration(
              fillColor: InsetsColors.tffFillColor,
              filled: true,
              prefixIcon: Icon(Icons.login),
              label: Text("Login"),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: InsetsColors.tffBorderColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: Insets.m),
          TextFormField(
            controller: passwdController,
            obscureText: true,
            decoration: const InputDecoration(
              fillColor: InsetsColors.tffFillColor,
              filled: true,
              prefixIcon: Icon(Icons.password),
              label: Text("Password"),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: InsetsColors.tffBorderColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: Insets.s),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: InsetsColors.eButBackgroundColor,
              fixedSize: const Size(200, 40),
            ),
            child: const Text(
              "Sign in",
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
