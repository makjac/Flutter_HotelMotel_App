// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:hotel_motel/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/models/search_cryteria.dart';

import '../../../theme/design_system.dart';
import '../../../widgets/cards/hotel_thumbnail.dart';

class ResultsList extends StatelessWidget {
  final List<HotelThumbnailModel> thumbnails;
  final SearchCryteria? searchCryteria;
  const ResultsList({
    Key? key,
    required this.thumbnails,
    this.searchCryteria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Insets.xs),
              child: Text(
                "${thumbnails.length} results founded!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Column(
              children: thumbnails
                  .map((thumbnail) => HotelThumbnail(
                        hotel: thumbnail,
                        searchCryteria: searchCryteria,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
