import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/data/models/search_cryteria.dart';
import 'package:hotel_motel/screens/results_screens/bloc/result_search_bloc.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

class ResultsPage extends StatefulWidget {
  final SearchCryteria searchCryteria;

  const ResultsPage({required this.searchCryteria, Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => RresultStatesPage();
}

class RresultStatesPage extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
      ),
      body: BlocProvider<ResultSearchBloc>(
          create: (context) => ResultSearchBloc()
            ..add(LoadSearchResults(searchCryteria: widget.searchCryteria)),
          child: BlocBuilder<ResultSearchBloc, ResultSearchState>(
            builder: (context, state) {
              if (state is LoadSearchResults) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ResultsLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.s),
                    child: Column(
                      children: state.thumbnails
                          .map((thumbnail) => HotelThumbnail(hotel: thumbnail))
                          .toList(),
                    ),
                  ),
                );
              }
              return Center(
                child: const Text('Something went wrong...'),
              );
            },
          )),
    );
  }
}
