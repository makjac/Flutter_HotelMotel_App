import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/bloc/hotel_thumbnail/hotel_thumbnail_bloc.dart';
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
          padding: const EdgeInsets.all(Insets.s),
          child: BlocBuilder<HotelThumbnailBloc, HotelThumbnailState>(
            builder: ((context, state) {
              if (state is ThumbnailsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ThumbnailsLoaded) {
                return Column(
                  children: state.hotelThumbnails
                      .map((thumbnail) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: Insets.xs,
                            ),
                            child: HotelThumbnail(hotel: thumbnail),
                          ))
                      .toList(),
                );
              }
              if (state is ThumbnailError) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Center(
                child: const Text("Something went wrong."),
              );
            }),
          ),
        ),
      ),
    );
  }
}
