// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hotel_motel/screens/add_review_screen/widgets/review_header.dart';
import 'package:hotel_motel/theme/theme_base.dart';

typedef void DoubleCallback(double value);

class ReviewStarRating extends StatelessWidget {
  final DoubleCallback onChanged;
  const ReviewStarRating({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewHeader(label: "How did you enjoy your stay?"),
          const SizedBox(height: Insets.xs),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(Insets.xs),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.s),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _label("bad"),
                  Center(
                    child: RatingBar(
                        glow: false,
                        itemCount: 5,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: Icon(
                            Icons.star_half,
                            color: Colors.amber[100],
                          ),
                          empty: Icon(
                            Icons.star_outline_outlined,
                            color: Colors.white,
                          ),
                        ),
                        onRatingUpdate: ((value) {
                          onChanged(value);
                        })),
                  ),
                  _label("good"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _label(String label) {
    return Text(
      label,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
