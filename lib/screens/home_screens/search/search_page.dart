import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/screens/home_screens/search/bloc/rcomended_bloc.dart';
import 'package:hotel_motel/screens/home_screens/search/search_form.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

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
        room: HomeShared.getRoomsCount(),
        adult: HomeShared.getAtultsCount(),
        kid: HomeShared.getKidsCount(),
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
          BlocBuilder<RecomendedBloc, RecomendedState>(
            builder: (context, state) {
              if (state is LoadingRecommendation) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is RecommendationLoaded) {
                return Column(
                  children: state.thumbnails
                      .map((thumbnail) => HotelThumbnail(hotel: thumbnail))
                      .toList(),
                );
              }
              if (state is RecomendedError) {
                return Center(
                  child: const Text("Unable to load recomendation..."),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
