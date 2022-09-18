import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/data/models/hotel_thumbnail_model.dart';
import 'package:hotel_motel/data/models/results_filters.dart';
import 'package:hotel_motel/data/models/search_cryteria.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/results_screens/bloc/result_search_bloc.dart';
import 'package:hotel_motel/screens/results_screens/results_sort_values.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/cards/hotel_thumbnail.dart';

class ResultsPage extends StatefulWidget {
  final SearchCryteria searchCryteria;

  const ResultsPage({required this.searchCryteria, Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => RresultStatesPage();
}

class RresultStatesPage extends State<ResultsPage> {
  SortValues? _character = SortValues.sortRatingHL;
  ResultsFilters _filters = ResultsFilters();

  @override
  void initState() {
    locator
        .get<ResultSearchBloc>()
        .add(LoadSearchResults(searchCryteria: widget.searchCryteria));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
        bottom: _appBarBottom(context),
      ),
      body: _searchResults(),
    );
  }

  PreferredSize _appBarBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(Insets.xs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _sortButton(),
              const SizedBox(width: Insets.m),
              _filterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sortButton() {
    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) => Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _radioButtom(
                    SortValues.sortPriceLH,
                    Icon(Icons.arrow_upward),
                    "Sort by Price",
                    "Smallest to largest",
                  ),
                  _radioButtom(
                    SortValues.sortPriceHL,
                    Icon(Icons.arrow_downward),
                    "Sort by Price",
                    "Largest to smallest",
                  ),
                  _radioButtom(
                    SortValues.sortRatingLH,
                    Icon(Icons.arrow_upward),
                    "Sort by Rating",
                    "Smallest to largest",
                  ),
                  _radioButtom(
                    SortValues.sortRatingHL,
                    Icon(Icons.arrow_downward),
                    "Sort by Rating",
                    "Largest to smallest",
                  ),
                ],
              ),
            ),
          ),
        );
      },
      icon: Icon(Icons.sort),
      label: const Text("Sort"),
    );
  }

  Widget _radioButtom(SortValues filter, Icon icon, String title,
      [String? subtitle]) {
    return RadioListTile(
      value: filter,
      groupValue: _character,
      onChanged: (value) {
        _character = filter;
        BlocProvider.of<ResultSearchBloc>(context)
            .add(SortResults(value: _character!));
        Navigator.pop(context);
      },
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : Container(),
      secondary: icon,
    );
  }

  Widget _filterButton() {
    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet<void>(
            context: context,
            builder: ((context) => Center(
                  child: const Text("filter"),
                )));
      },
      icon: Icon(Icons.filter_alt_outlined),
      label: const Text("Filter"),
    );
  }

  Widget _searchResults() {
    return BlocConsumer<ResultSearchBloc, ResultSearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingResults || state is SortingResults) {
          return _loadingResults();
        }
        if (state is ResultsLoaded) {
          return _resultsLoaded(state.thumbnails);
        }
        return Center(
          child: const Text('Something went wrong...'),
        );
      },
    );
  }

  Widget _loadingResults() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _resultsLoaded(List<HotelThumbnailModel> thumbnails) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Insets.xs),
              child: Text(
                "${thumbnails.length} results founded!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Column(
              children: thumbnails
                  .map((thumbnail) => HotelThumbnail(hotel: thumbnail))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
