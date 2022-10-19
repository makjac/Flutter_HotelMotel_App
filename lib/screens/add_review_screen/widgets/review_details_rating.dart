// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/review_details_model.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_details_slider.dart';
import 'package:hotel_motel/screens/add_review_screen/widgets/review_header.dart';

import '../../../theme/design_system.dart';

typedef void ReviewDetailsCallback(ReviewDetailsModel details);

class ReviewDetailsRating extends StatefulWidget {
  final ReviewDetailsCallback onChanged;
  ReviewDetailsRating({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ReviewDetailsRating> createState() => _ReviewDetailsRatingState();
}

class _ReviewDetailsRatingState extends State<ReviewDetailsRating> {
  ReviewDetailsModel details = ReviewDetailsModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ReviewHeader(label: "Booking details"),
          SizedBox(height: Insets.xs),
          _sliders(),
        ],
      ),
    );
  }

  Widget _sliders() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.xs),
        child: Column(
          children: [
            ReviewDetailsSlider(
                label: "Purity",
                value: details.purity,
                onChanged: (value) {
                  details.purity = value;
                  widget.onChanged(details);
                }),
            ReviewDetailsSlider(
                label: "Comfort",
                value: details.comfort,
                onChanged: (value) {
                  details.comfort = value;
                  widget.onChanged(details);
                }),
            ReviewDetailsSlider(
                label: "Amenities",
                value: details.amenities,
                onChanged: (value) {
                  details.amenities = value;
                  widget.onChanged(details);
                }),
            ReviewDetailsSlider(
                label: "Staff",
                value: details.staff,
                onChanged: (value) {
                  details.staff = value;
                  widget.onChanged(details);
                }),
            ReviewDetailsSlider(
                label: "Price",
                value: details.price,
                onChanged: (value) {
                  details.price = value;
                  widget.onChanged(details);
                })
          ],
        ),
      ),
    );
  }
}
