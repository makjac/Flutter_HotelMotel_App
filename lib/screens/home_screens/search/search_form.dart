import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/theme/design_system.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.brown, width: 5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: InsetsColors.splashColor,
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(width: Insets.s),
                    Text("Poznań"),
                  ],
                ),
              ),
            ),
          ),
          Container(color: Colors.brown, width: double.infinity, height: 5),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: InsetsColors.splashColor,
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Row(
                  children: const [
                    Icon(Icons.date_range),
                    SizedBox(width: Insets.s),
                    Text("czw. 25 sie - niedz. 28 sie")
                  ],
                ),
              ),
            ),
          ),
          Container(color: Colors.brown, width: double.infinity, height: 5),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: InsetsColors.splashColor,
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(width: Insets.s),
                    Text("1 pokój - 2 dorosłych - 0 dzieci")
                  ],
                ),
              ),
            ),
          ),
          Container(color: Colors.brown, width: double.infinity, height: 5),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: InsetsColors.splashColor,
              child: Container(
                width: double.infinity,
                color: Colors.brown[400],
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Text(
                    "Search",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
