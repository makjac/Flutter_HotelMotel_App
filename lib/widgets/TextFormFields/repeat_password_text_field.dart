import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';

class RepeatPasswordTextField extends StatelessWidget {
  final TextEditingController repeatPasswordController;

  const RepeatPasswordTextField(
      {required this.repeatPasswordController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == "") {
          return "The field is empty";
        }
        return null;
      },
      controller: repeatPasswordController,
      obscureText: true,
      decoration: const InputDecoration(
        fillColor: InsetsColors.tffFillColor,
        filled: true,
        prefixIcon: Icon(Icons.password),
        label: Text("Repeat password"),
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
