import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/auth_screens/forgot_password/fotgot_password_form.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
            if (state is ResetPasswdEmailSend) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.LOGIN_ROUTE, (route) => false);
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          child: AuthScreenTemplate(
              header: "Forgot Password", form: ForgotPasswordForm()),
        ),
      ),
    );
  }
}
