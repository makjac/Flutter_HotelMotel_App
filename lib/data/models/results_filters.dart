// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ResultsFilters extends Equatable {
  RangeValues priceRange;
  RangeValues ratingRange;
  bool isFreeCancelling;
  bool isDiscount;
  ResultsFilters({
    RangeValues? priceRang,
    RangeValues? ratingRang,
    this.isFreeCancelling = false,
    this.isDiscount = false,
  })  : priceRange = priceRang ?? RangeValues(0, 1000),
        ratingRange = ratingRang ?? RangeValues(0, 5);

  @override
  List<Object> get props =>
      [priceRange, ratingRange, isFreeCancelling, isDiscount];
}
