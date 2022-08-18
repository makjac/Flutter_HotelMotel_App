import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/home_screens_base.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/bottom_navigator_bar/bnb_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTap(int tabIndex) {
    if (_currentIndex != tabIndex) {
      setState(() {
        _currentIndex = tabIndex;
      });
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    SearchPage(),
    FavoritePage(),
    BookingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar:
          BNBHome(currentTabIndex: _currentIndex, onTap: _onTap),
    ));
  }
}
