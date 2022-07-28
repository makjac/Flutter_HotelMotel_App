import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/data/repository/auth_repository.dart';
import 'package:hotel_motel/screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';
import 'package:hotel_motel/widgets/decorations/auth_screen_shapes.dart';

class SignInPage extends StatefulWidget {
  final AuthRepository repository;

  const SignInPage({required this.repository, Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(repository: widget.repository);
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: Scaffold(
        backgroundColor: InsetsColors.backgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (ctx, state) {},
          child:
              const AuthScreenTemplate(header: "Sign In", form: SignInForm()),
        ),
      ),
    );
  }
}
