import 'package:flutter/material.dart';
import 'package:hotel_motel/temp/test_hotel.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Favorite"),
        backgroundColor: InsetsColors.abBackgroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Insets.xs),
          child: Column(
            children: TestHotel.hotels
                .map((e) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: Insets.xs,
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
