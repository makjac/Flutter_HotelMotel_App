import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/search/search_form.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: const Text("search"),
        backgroundColor: InsetsColors.abBackgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: SearchForm(
          location: "Poznań",
          dateRange: DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(const Duration(days: 7))),
        ),
      ),
    );
  }
}
