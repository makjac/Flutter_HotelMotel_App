// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BNBHome extends StatelessWidget {
  final BuildContext ctx;
  final GlobalKey<NavigatorState> navKey;
  const BNBHome({
    Key? key,
    required this.ctx,
    required this.navKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
      BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: "Booked"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "My profile"),
    ]);
  }
}
