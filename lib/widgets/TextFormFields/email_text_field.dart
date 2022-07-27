import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailTextField({required this.emailController ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        fillColor: InsetsColors.tffFillColor,
        filled: true,
        prefixIcon: Icon(Icons.login),
        label: Text("Email"),
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
