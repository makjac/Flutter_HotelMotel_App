import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/decorations/auth_screen_shapes.dart';

class AuthScreenTemplate extends StatelessWidget {
  final String header;
  final Widget form;

  const AuthScreenTemplate({required this.header, required this.form, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
          minWidth: width,
        ),
        child: AuthScreenShapes(
          child: Column(
            children: [
              Text(
                header,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: InsetsColors.authHeaderTextColor,
                ),
              ),
              const SizedBox(height: Insets.s),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: InsetsColors.authBackgroundFormColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      width: 5, color: InsetsColors.authBorderFormColor),
                ),
                child: SizedBox(
                  width: width * 0.6,
                  child: form,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
