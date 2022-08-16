import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HotelLite {
  final String title;
  final double rating;
  final double price;
  final double? discount;
  final bool isFreeCanceling;
  HotelLite({
    required this.title,
    required this.rating,
    required this.price,
    this.discount,
    required this.isFreeCanceling,
  });

  HotelLite copyWith({
    String? title,
    double? rating,
    double? price,
    double? discount,
    bool? isFreeCanceling,
  }) {
    return HotelLite(
      title: title ?? this.title,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      isFreeCanceling: isFreeCanceling ?? this.isFreeCanceling,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'rating': rating,
      'price': price,
      'discount': discount,
      'isFreeCanceling': isFreeCanceling,
    };
  }

  factory HotelLite.fromMap(Map<String, dynamic> map) {
    return HotelLite(
      title: map['title'] as String,
      rating: map['rating'] as double,
      price: map['price'] as double,
      discount: map['discount'] != null ? map['discount'] as double : null,
      isFreeCanceling: map['isFreeCanceling'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelLite.fromJson(String source) =>
      HotelLite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HotelLite(title: $title, rating: $rating, price: $price, discount: $discount, isFreeCanceling: $isFreeCanceling)';
  }

  @override
  bool operator ==(covariant HotelLite other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.rating == rating &&
        other.price == price &&
        other.discount == discount &&
        other.isFreeCanceling == isFreeCanceling;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        isFreeCanceling.hashCode;
  }
}
