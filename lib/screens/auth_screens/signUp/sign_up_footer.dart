import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, AppRoute.LOGIN_ROUTE),
          style: TextButton.styleFrom(
            primary: InsetsColors.tButColor,
          ),
          child: const Text("Sign In"),
        ),
      ],
    );
  }
}
