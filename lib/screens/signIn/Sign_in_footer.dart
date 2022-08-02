import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/theme/design_system.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, AppRoute.REGISTER_ROUTE),
          style: TextButton.styleFrom(
            primary: InsetsColors.tButColor,
          ),
          child: const Text("Sign Up"),
        ),
      ],
    );
  }
}
