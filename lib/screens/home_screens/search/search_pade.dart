import 'package:flutter/material.dart';
import 'package:hotel_motel/data/models/thumbnail_room_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

List<HotelLite> hotels = [
  HotelLite(
    title: "Rezydencja Wind Rose - luxury ApartHotel",
    rating: 2.465,
    price: 120,
    isFreeCanceling: true,
  ),
  HotelLite(
    title: "Rezydencja Wind Rose - luxury ApartHotel",
    rating: 4,
    price: 145.4,
    discount: 5,
    isFreeCanceling: false,
  ),
  HotelLite(
    title: "Rezydencja Wind Rose - luxury ApartHotel",
    rating: 1.3,
    price: 340,
    discount: 20,
    isFreeCanceling: true,
  ),
  HotelLite(
    title: "Rezydencja Wind Rose - luxury ApartHotel",
    rating: 3.54,
    price: 1123.56,
    isFreeCanceling: false,
  ),
  HotelLite(
    title: "Rezydencja Wind Rose - luxury ApartHotel",
    rating: 5,
    price: 500,
    discount: 15,
    isFreeCanceling: false,
  ),
  HotelLite(
    title: "Rezydencja Wind Rose - luxury ApartHotel",
    rating: 0.1,
    price: 123,
    discount: 50,
    isFreeCanceling: true,
  ),
];

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: const Text("search"),
        backgroundColor: InsetsColors.abBackgroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: hotels
                .map((e) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: HotelThumbnail(hotel: e),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
