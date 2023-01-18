// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ReviewDetailsModel extends Equatable {
  num total;
  num purity;
  num comfort;
  num amenities;
  num staff;
  num location;
  num price;
  ReviewDetailsModel({
    this.total = 0,
    this.purity = 0,
    this.comfort = 0,
    this.amenities = 0,
    this.staff = 0,
    this.location = 0,
    this.price = 0,
  });

  @override
  List<Object?> get props => [
        total,
        purity,
        comfort,
        amenities,
        staff,
        location,
        price,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'cleanliness': purity,
      'comfort': comfort,
      'amenities': amenities,
      'personnel': staff,
      'location': location,
      'price': price,
    };
  }

  factory ReviewDetailsModel.fromMap(Map<String, dynamic> map) {
    return ReviewDetailsModel(
      total: map['total'] as num,
      purity: map['cleanliness'] as num,
      comfort: map['comfort'] as num,
      amenities: map['amenities'] as num,
      staff: map['personnel'] as num,
      location: map['location'] as num,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewDetailsModel.fromJson(String source) =>
      ReviewDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
