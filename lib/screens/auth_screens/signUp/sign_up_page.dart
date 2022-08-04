import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/auth_screens/signUp/sign_up_footer.dart';
import 'package:hotel_motel/screens/auth_screens/signUp/sign_up_form.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = locator.get<AuthBloc>();
  }

  @override
  void deactivate() {
    _authBloc.close();
    super.deactivate();
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
          listener: (ctx, state) {
            if (state is Authorized) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.HOME_ROUTE, (route) => false);
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          child: AuthScreenTemplate(
              header: "Sign Up",
              form: SignUpForm(),
              footer: const SignUpFooter()),
        ),
      ),
    );
  }
}
