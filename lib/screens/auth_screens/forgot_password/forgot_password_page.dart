import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth/auth_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/screens/auth_screens/forgot_password/fotgot_password_form.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/Screens_templates/auth_screen_template.dart';

import '../../../data/repository/firebase/analitic/analitics_repository.dart';
import '../../../locator.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  void initState() {
    locator.get<AnalyticsRepository>().measureScreenview({
      'firebase_screen': 'forgot_password_page',
      'firebase_screen_class': 'auth',
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
