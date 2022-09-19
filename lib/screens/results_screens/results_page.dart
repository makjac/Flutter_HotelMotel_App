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
  ResultsFilters _tempFilters = ResultsFilters();

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
              _filterButton(context),
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
            .add(SortResults(value: _character!, filters: _filters));
        Navigator.pop(context);
      },
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : Container(),
      secondary: icon,
    );
  }

  Widget _filterButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: ((context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Center(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(Insets.s),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _filterLabel("Price in range:"),
                            RangeSlider(
                              values: _tempFilters.priceRange,
                              min: 0,
                              max: 1000,
                              divisions: 20,
                              labels: RangeLabels(
                                  _tempFilters.priceRange.start
                                      .round()
                                      .toString(),
                                  _tempFilters.priceRange.end != 1000
                                      ? _tempFilters.priceRange.end
                                          .round()
                                          .toString()
                                      : "+1000"),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _tempFilters.priceRange = values;
                                });
                              },
                            ),
                            const SizedBox(height: Insets.s),
                            _filterLabel("Rating in range:"),
                            RangeSlider(
                              values: _tempFilters.ratingRange,
                              min: 0.0,
                              max: 5.0,
                              divisions: 10,
                              labels: RangeLabels(
                                "${_tempFilters.ratingRange.start} ⭐",
                                "${_tempFilters.ratingRange.end} ⭐",
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _tempFilters.ratingRange = values;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("Only with free canceling!"),
                              secondary: Icon(Icons.monetization_on_outlined),
                              value: _tempFilters.isFreeCancelling,
                              onChanged: ((value) {
                                setState(() {
                                  _tempFilters.isFreeCancelling =
                                      value ?? false;
                                });
                              }),
                            ),
                            CheckboxListTile(
                                title: const Text("Only with a discount"),
                                secondary:
                                    Icon(Icons.account_balance_wallet_outlined),
                                value: _tempFilters.isDiscount,
                                onChanged: ((value) {
                                  setState(() {
                                    _tempFilters.isDiscount = value ?? false;
                                  });
                                })),
                            const SizedBox(height: Insets.l),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _filters = _tempFilters;
                                  BlocProvider.of<ResultSearchBloc>(context)
                                      .add(SortResults(
                                          value: _character!,
                                          filters: _filters));
                                  Navigator.pop(context);
                                },
                                child: const Text("Filter!"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        );
      },
      icon: Icon(Icons.filter_alt_outlined),
      label: const Text("Filter"),
    );
  }

  Text _filterLabel(String label) => Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );

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
