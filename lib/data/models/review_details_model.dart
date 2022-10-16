import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ReviewDetailsModel extends Equatable {
  double purity;
  double comfort;
  double amenities;
  double staff;
  double location;
  double price;
  ReviewDetailsModel({
    this.purity = 0,
    this.comfort = 0,
    this.amenities = 0,
    this.staff = 0,
    this.location = 0,
    this.price = 0,
  });

  @override
  List<Object?> get props => [
        purity,
        comfort,
        amenities,
        staff,
        location,
        price,
      ];
}
