// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/TextFormFields/email_text_field.dart';
import 'package:hotel_motel/widgets/TextFormFields/password_text_field.dart';

class SignInForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSignIn(String email, String password) {
      if (_formKey.currentState!.validate()) {
        BlocProvider.of<AuthBloc>(context)
            .add(SignInRequest(email: email, passwd: password));
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextField(emailController: emailController),
          const SizedBox(height: Insets.m),
          PasswordTextField(passwordController: passwordController),
          const SizedBox(height: Insets.s),
          ElevatedButton(
            onPressed: () =>
                _onSignIn(emailController.text, passwordController.text),
            style: ElevatedButton.styleFrom(
              primary: InsetsColors.eButBackgroundColor,
              fixedSize: const Size(200, 40),
            ),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (ctx, state) {
                if (state is Processing) {
                  return const CircularProgressIndicator(
                    color: InsetsColors.cpiColor,
                  );
                } else {
                  return const Text(
                    "Sign in",
                    style: TextStyle(
                      color: InsetsColors.eButTextColor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
