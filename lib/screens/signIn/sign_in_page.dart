import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/data/repository/auth_repository.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/signIn/sign_in_footer.dart';
import 'package:hotel_motel/screens/signIn/sign_in_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            if (state is LoggedIn) {
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
              header: "Sign In",
              form: SignInForm(),
              footer: const SignInFooter()),
        ),
      ),
    );
  }
}
