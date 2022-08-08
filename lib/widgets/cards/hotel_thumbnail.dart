// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/design_system.dart';

class HotelThumbnail extends StatelessWidget {
  final String title;
  const HotelThumbnail({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                "https://pliki.propertydesign.pl/i/12/62/06/126206_r0_300.jpg",
                fit: BoxFit.fitHeight,
                height: 200,
              ),
            ),
            const SizedBox(width: Insets.s),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    title,
                    softWrap: false,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
