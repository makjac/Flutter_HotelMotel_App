// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/home_screens/search/location_search_action.dart';

import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/utils/date.dart';

class SearchForm extends StatefulWidget {
  String? location = "Pick location";
  final DateTimeRange? dateRange;
  final int? rooms;
  final int? adults;
  final int? kids;
  SearchForm({
    Key? key,
    this.location,
    this.dateRange,
    this.rooms = 1,
    this.adults = 1,
    this.kids = 0,
  }) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.brown, width: 5)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _locationPicker(context),
          _spacer(),
          _dateRangePicker(),
          _spacer(),
          _detailsPicker(),
          _spacer(),
          _searchButton(),
        ],
      ),
    );
  }

  Widget _spacer() {
    return Container(
      color: Colors.brown,
      width: double.infinity,
      height: 5,
    );
  }

  Widget _locationPicker(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await showSearch(context: context, delegate: LocationSearchAction())
              .then((value) {
            if (value != "") {
              widget.location = value;
            }
          });
          setState(() {});
        },
        splashColor: InsetsColors.splashColor,
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: Insets.s),
              Text(widget.location!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateRangePicker() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: InsetsColors.splashColor,
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Row(
            children: [
              const Icon(Icons.date_range),
              const SizedBox(width: Insets.s),
              Text(_dateText()),
            ],
          ),
        ),
      ),
    );
  }

  String _dateText() {
    if (widget.dateRange == null) {
      return "Pick date";
    } else {
      return "${Date.shortenDateToString(widget.dateRange!.start)} - ${Date.shortenDateToString(widget.dateRange!.end)}";
    }
  }

  Widget _detailsPicker() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: InsetsColors.splashColor,
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: Insets.s),
              Text(
                  "${widget.rooms} pokój - ${widget.adults} dorosłych - ${widget.kids} dzieci")
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: InsetsColors.splashColor,
        child: Container(
          width: double.infinity,
          color: Colors.brown[400],
          child: const Center(
              child: Padding(
            padding: EdgeInsets.all(13),
            child: Text(
              "Search",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
          )),
        ),
      ),
    );
  }
}
