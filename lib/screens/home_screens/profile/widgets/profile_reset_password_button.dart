import 'package:flutter/material.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';

import '../../../../theme/design_system.dart';

class ProfileResetPasswordButton extends StatelessWidget {
  const ProfileResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure you want to reset your password?"),
            content: Text(
                'If so, an email will be sent to you with a link to reset your password'),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text("Yes")),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "No",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
      child: Row(
        children: [
          Icon(
            Icons.refresh_outlined,
            color: const Color.fromARGB(255, 36, 36, 36),
          ),
          const SizedBox(width: Insets.s),
          Text(
            "Reset Password",
            style: const TextStyle(
              color: Color.fromARGB(255, 36, 36, 36),
            ),
          ),
        ],
      ),
    );
  }
}
