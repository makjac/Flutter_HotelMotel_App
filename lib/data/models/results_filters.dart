// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ResultsFilters extends Equatable {
  final num minPrice;
  final num maxPrice;
  final num nimRating;
  final num maxRating;
  final bool isFreeCancelling;
  ResultsFilters({
    this.minPrice = 0,
    this.maxPrice = double.infinity,
    this.nimRating = 0,
    this.maxRating = 10,
    this.isFreeCancelling = false,
  });

  @override
  List<Object> get props {
    return [
      minPrice,
      maxPrice,
      nimRating,
      maxRating,
      isFreeCancelling,
    ];
  }
}
