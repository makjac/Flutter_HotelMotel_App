import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: InsetsColors.abBackgroundColor,
        centerTitle: true,
      ),
    );
  }
}
