import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_page_header.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/summary/score_label.dart';

import '../../../../theme/design_system.dart';
import '../../../../utils/scale.dart';
import '../../../../widgets/score_bars/number_box.dart';

class HotelSummary extends StatefulWidget {
  final Hotel hotel;
  const HotelSummary({required this.hotel, super.key});

  @override
  State<HotelSummary> createState() => _HotelSummaryState();
}

class _HotelSummaryState extends State<HotelSummary> {
  bool _readMore = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelPageHeader(label: "Summary"),
        const SizedBox(height: Insets.s),
        _hotelScore(width, widget.hotel),
        const SizedBox(height: Insets.s),
        Text(
          widget.hotel.description,
          textAlign: TextAlign.justify,
          overflow: _readMore ? null : TextOverflow.ellipsis,
          textScaleFactor: Scale.textScale(width, 1.3),
          maxLines: _readMore ? null : 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  _readMore = !_readMore;
                  setState(() {});
                },
                child: Text(_readMore ? "Show less" : "Show more")),
          ],
        )
      ],
    );
  }

  Widget _hotelScore(double width, Hotel hotel) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberBox(
              number: (hotel.rating / 100) * 5,
              textPadding: 5,
              textScale: 1.1,
              color: Colors.black,
            ),
            const SizedBox(width: Insets.xs),
            _stars(width, hotel.rating),
          ],
        ),
        const SizedBox(height: Insets.xs),
        ScoreLabel(label: "Czystość", score: hotel.score['purity'] as num),
        ScoreLabel(label: "Komfort", score: hotel.score['comfort'] as num),
        ScoreLabel(
            label: "Udogodnienia", score: hotel.score['facilities'] as num),
        ScoreLabel(label: "Personel", score: hotel.score['staff'] as num),
        ScoreLabel(label: "Lokalizacja", score: hotel.score['location'] as num),
        ScoreLabel(label: "Cena", score: hotel.score['price'] as num),
      ],
    );
  }

  Widget _stars(double width, num rating) {
    return RatingBar(
      itemCount: 5,
      initialRating: (rating / 100) * 5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 25 * Scale.textScale(width, 1.3),
      ratingWidget: RatingWidget(
        empty: Icon(Icons.star_border_rounded, color: Colors.amber[100]),
        half: Icon(Icons.star_half_rounded, color: Colors.amber[300]),
        full: Icon(Icons.star_rounded, color: Colors.amber[600]),
      ),
      onRatingUpdate: (value) {},
    );
  }
}
