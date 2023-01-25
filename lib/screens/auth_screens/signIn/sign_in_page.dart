import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/screens/auth_screens/signIn/sign_in_footer.dart';
import 'package:hotel_motel/screens/auth_screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: InsetsColors.backgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (ctx, state) {
            if (state is LoggedIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.HOME_ROUTE, (route) => false);
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
            if (state is UserLoggedIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.HOME_ROUTE, (route) => false);
            }
          },
          child: AuthScreenTemplate(
              header: "Sign In",
              form: SignInForm(),
              footer: const SignInFooter()),
        ),
      ),
    );
  }
}
