import 'package:flutter/material.dart';
import 'package:hotel_motel/data/models/search_details_model.dart';
import 'package:hotel_motel/screens/home_screens/search/search_form.dart';
import 'package:hotel_motel/temp/test_hotel.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';
import 'package:hotel_motel/widgets/cards/search_thubmnail.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchForm(),
            _recomended(),
            _searchAgain(),
            const SizedBox(height: Insets.xs),
          ],
        ),
      ),
    );
  }

  Text _label(String label) {
    return Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _searchForm() {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: SearchForm(
        location: HomeShared.getLocation(),
      ),
    );
  }

  Widget _recomended() {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label("Recomended"),
          const SizedBox(height: Insets.s),
          HotelThumbnail(hotel: TestHotel.hotels[2]),
          HotelThumbnail(hotel: TestHotel.hotels[4]),
          HotelThumbnail(hotel: TestHotel.hotels[3]),
        ],
      ),
    );
  }

  Widget _searchAgain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.s),
          child: _label("Search again"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(Insets.xs),
            child: Row(
              children: TestHotel.searchList
                  .map((search) => Padding(
                        padding: const EdgeInsets.all(Insets.xs),
                        child: SearchThumbnail(data: search),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
