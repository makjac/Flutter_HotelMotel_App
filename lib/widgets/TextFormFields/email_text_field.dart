import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/validation.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailTextField({required this.emailController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == "") {
          return "The field is empty";
        }
        if (!AppValidator.isEmail(value)) {
          return "email address is not valid";
        }
        return null;
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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
