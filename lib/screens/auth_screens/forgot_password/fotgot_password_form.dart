import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/TextFormFields/email_text_field.dart';

class ForgotPasswordForm extends StatelessWidget {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSignIn(String email) {
      if (_formKey.currentState!.validate()) {
        BlocProvider.of<AuthBloc>(context)
            .add(ForgotPasswdRequest(email: email));
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextField(emailController: emailController),
          const SizedBox(height: Insets.s),
          ElevatedButton(
            onPressed: () => _onSignIn(emailController.text),
            style: ElevatedButton.styleFrom(
              primary: InsetsColors.eButBackgroundColor,
              fixedSize: const Size(200, 40),
            ),
            child: const Text(
              "Refresh password",
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
