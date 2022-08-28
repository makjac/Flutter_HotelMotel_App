import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/auth_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/data/controller/user_controller.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/home_screens/profile/profile_header.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = locator.get<UserController>().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: Text("Hi, ${currentUser?.displayName ?? "nice to see you"}!"),
        backgroundColor: InsetsColors.abBackgroundColor,
        //shadowColor: Colors.transparent,
        shadowColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(imgUrl: currentUser?.avatarUrl),
          const SizedBox(height: Insets.xs),
          Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: Column(
              children: [
                _button(
                  Icons.add_business,
                  "Register own hotel",
                  () {},
                ),
                const SizedBox(height: Insets.xs),
                _logoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 36, 36, 36),
          ),
          const SizedBox(width: Insets.s),
          Text(
            label,
            style: const TextStyle(
              color: Color.fromARGB(255, 36, 36, 36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignedOut) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.LOGIN_ROUTE, (route) => false);
                  }
                },
                child: AlertDialog(
                  title: const Center(child: Text("Log out")),
                  content: const Text("Are you sure, you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "No",
                      ),
                    ),
                    TextButton(
                      onPressed: () => BlocProvider.of<AuthBloc>(context)
                          .add(SignOutRequest()),
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Row(
        children: const [
          Icon(
            Icons.logout_outlined,
            color: Colors.red,
          ),
          SizedBox(width: Insets.s),
          Text(
            "Log out",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
