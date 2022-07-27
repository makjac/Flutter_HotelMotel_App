import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordTextField({required this.passwordController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
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
    );
  }
}
