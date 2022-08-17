// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/search_details_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/date.dart';
import 'package:hotel_motel/utils/scale.dart';

class SearchThumbnail extends StatelessWidget {
  final SearchDetails data;
  const SearchThumbnail({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: width / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  "https://www.polska.travel/images/pl-PL/glowne-miasta/poznan/poznan_stare_miasto_2_1170.jpg"),
            ),
            const SizedBox(height: Insets.xs),
            Text(
              data.location,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: Scale.textScale(width, 1.5),
            ),
            Text(
              "${Date.shortenDateToString(data.start)} - ${Date.shortenDateToString(data.end)}",
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
