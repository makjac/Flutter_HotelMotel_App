import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, AppRoute.FORGPASS_ROUTE),
          style: TextButton.styleFrom(
            primary: InsetsColors.tButColor,
          ),
          child: const Text("Forgot Password?"),
        ),
      ],
    );
  }
}
