import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/repository/model_repositores/hotel_repository/hotel_repository.dart';
import 'package:hotel_motel/data/repository/model_repositores/room_repository/room_repository.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/home_screens/favorite/bloc/favorite_bloc.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

import '../../../data/controller/user/user_controller.dart';
import '../../../data/repository/firebase/analitic/analitics_repository.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    locator.get<AnalyticsRepository>().measureScreenview({
      'firebase_screen': 'favorite_page',
      'firebase_screen_class': 'home',
      'hm_user': locator.get<UserController>().currentUserUid!,
    });
    super.initState();
  }

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
    create: (context) => FavoriteBloc(
      hotelRepository: locator.get<HotelRepository>(),
      roomRepository: locator.get<RoomRepository>(),
    )..add(LoadHotelsEvt()),
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
