// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';

class BNBHome extends StatelessWidget {
  final int currentTabIndex;
  final void Function(int) onTap;
  const BNBHome({
    Key? key,
    required this.currentTabIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: InsetsColors.BNBBackgroundColor,
      selectedItemColor: InsetsColors.BNBSelectedItemColor,
      unselectedItemColor: InsetsColors.BNBUnselectedItemColor,
      unselectedIconTheme: const IconThemeData(size: 22),
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_circle), label: "Booked"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "My profile"),
      ],
      currentIndex: currentTabIndex,
      onTap: onTap,
    );
  }
}
