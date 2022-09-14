import 'package:flutter/material.dart';

class LocationSearchAction extends SearchDelegate<String> {
  final locations = [
    "Poznan",
    "Warszawa",
    "Kraków",
    "Szcecin",
    "Tarnów",
    "Wronki",
    "Bydgoszcz",
    "Plewiska",
    "Łódź",
    "Opole",
    "Koszalin",
    "Turek",
  ];

  final recentLocations = [
    "Poznań",
    "Gdańsk",
    "Gniezno",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> allLaocations = locations
        .where(
          (location) => location.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemBuilder: ((context, index) => ListTile(
            leading: const Icon(Icons.draw),
            title: Text(allLaocations[index]),
            onTap: () => close(context, allLaocations[index]),
          )),
      itemCount: allLaocations.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentLocations
        : locations
            .where(
              (location) => location.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.draw),
        title: Text(suggestionList[index]),
        onTap: () => close(context, suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
