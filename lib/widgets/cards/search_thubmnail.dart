// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/scale.dart';

class SearchThumbnail extends StatelessWidget {
  //final StorageController _storageController = locator.get<StorageController>();
  const SearchThumbnail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.RESULTS_ROUTE);
      },
      child: SizedBox(
        width: width / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  width: double.infinity, fit: BoxFit.cover, "www.wp.pl"),
            ),
            const SizedBox(height: Insets.xs),
            Text(
              "Poznan",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: Scale.textScale(width, 1.5),
            ),
            Text(
              "data",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 10, color: Color.fromARGB(171, 0, 0, 0)),
              textScaleFactor: Scale.textScale(width, 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
