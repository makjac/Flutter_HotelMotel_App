import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/search/search_form.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

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
            //_searchAgain(),
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
          //TODO: add recomended hotels
          // HotelThumbnail(hotel: TestHotel.hotels[2]),
          // HotelThumbnail(hotel: TestHotel.hotels[4]),
          // HotelThumbnail(hotel: TestHotel.hotels[3]),
        ],
      ),
    );
  }

//   Widget _searchAgain() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: Insets.s),
//           child: _label("Search again"),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Padding(
//             padding: const EdgeInsets.all(Insets.xs),
//             child: ValueListenableBuilder<Box<Search>>(
//               valueListenable: Boxes.getSearch().listenable(),
//               builder: (context, box, _) {
//                 final searches = box.values.toList().cast<Search>();
//                 return Row(
//                   children: searches
//                       .map((search) => Padding(
//                             padding: const EdgeInsets.all(Insets.xs),
//                             child: SearchThumbnail(
//                               search: search,
//                             ),
//                           ))
//                       .toList(),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
}
