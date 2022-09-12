import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/screens/home_screens/favorite/bloc/favorite_bloc.dart';
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
      body: _favoriteBockBuldier(),
    );
  }
}

Widget _favoriteBockBuldier() {
  return BlocProvider<FavoriteBloc>(
    create: (context) => FavoriteBloc()..add(LoadHotelsEvt()),
    child: SafeArea(
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is LoadingFavoriteHotels) {
            return _loadingFavorite();
          }

          if (state is FavoriteHotelsLoaded) {
            return _favoritesLoaded(state.hotels);
          }

          if (state is NoFavorites) {
            return _noFavorites();
          }

          if (state is FavoriteError) {
            return _error(state.error);
          }

          return _error("Something went wrong...");
        },
      ),
    ),
  );
}

Widget _loadingFavorite() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget _favoritesLoaded(List<HotelThumbnailModel> hotels) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: Column(
        children:
            hotels.map((hotels) => HotelThumbnail(hotel: hotels)).toList(),
      ),
    ),
  );
}

Widget _noFavorites() {
  return Center(
    child: Text("You don't have any favorite hotel..."),
  );
}

Widget _error(String error) {
  return Center(
    child: Text(error),
  );
}
