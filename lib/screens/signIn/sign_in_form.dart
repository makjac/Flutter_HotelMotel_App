import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return
       Form(
      key: _formKey,
      child: Column(
      children: [
        TextFormField(),
        ElevatedButton(onPressed: (){}, child: const Text("click")),
      ],
    ),
    );
  }
}
