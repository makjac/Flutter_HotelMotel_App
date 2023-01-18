import 'package:flutter/material.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/models/search_cryteria.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/home_screens/search/location_search_action.dart';
import 'package:hotel_motel/service/analitics_service/analitics_service.dart';

import 'package:hotel_motel/theme/colors.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/utils/date.dart';
import 'package:hotel_motel/utils/userSharedPreferences.dart';
import 'package:hotel_motel/widgets/counter_widget/counter.dart';
import 'package:hotel_motel/widgets/counter_widget/counter_controller.dart';

// ignore: must_be_immutable
class SearchForm extends StatefulWidget {
  String? location;
  DateTimeRange? dateRange;
  int rooms;
  int adults;
  int kids;
  SearchForm({
    Key? key,
    this.location,
    DateTimeRange? range,
    int? room,
    int? adult,
    int? kid,
  })  : rooms = room ?? 1,
        adults = adult ?? 1,
        kids = kid ?? 0,
        super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final CounterController _roomsController = CounterController();
  final CounterController _adultsController = CounterController();
  final CounterController _kidsController = CounterController();
  final start = DateTime.now();
  final end = DateTime.now().add(const Duration(days: 7200));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 66, 66, 66), width: 5)),
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
      color: Color.fromARGB(255, 66, 66, 66),
      width: double.infinity,
      height: 5,
    );
  }

  //Location Picker

  Widget _locationPicker(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await showSearch(context: context, delegate: LocationSearchAction())
              .then((value) {
            if (value != "" && value != null) {
              widget.location = value;
              HomeShared.setLocation(value);
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
              Text(_locationText()),
            ],
          ),
        ),
      ),
    );
  }

  String _locationText() {
    if (widget.location != null) {
      return widget.location!;
    } else {
      return "Pick location";
    }
  }

  //Data range picker

  Widget _dateRangePicker() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await showDateRangePicker(
                  context: context, firstDate: start, lastDate: end)
              .then((range) {
            if (range != null) {
              widget.dateRange = range;
              HomeShared.setStartTime(range.start.millisecondsSinceEpoch);
              HomeShared.setEndTime(range.end.millisecondsSinceEpoch);
            }
          });
          setState(() {});
        },
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

  //DetailsPicker

  Widget _detailsPicker() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async => _detiailsDialog(),
        splashColor: InsetsColors.splashColor,
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: Insets.s),
              Text(
                  "${_roomStr(widget.rooms)} - ${_adultsStr(widget.adults)} - ${_kidsStr(widget.kids)}"),
            ],
          ),
        ),
      ),
    );
  }

  String _roomStr(int number) {
    if (number == 1) {
      return "$number pokój";
    }
    return "$number pokoje";
  }

  String _adultsStr(int number) {
    if (number == 1) {
      return "$number dorosły";
    }
    return "$number dorosłych";
  }

  String _kidsStr(int number) {
    if (number == 1) {
      return "$number dziecko";
    }
    return "$number dzieci";
  }

  Future _detiailsDialog() async {
    await showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Center(child: Text("Select rooms and guests")),
          content: IntrinsicHeight(
            child: Center(
              child: Column(
                children: [
                  _detailsPickCounter(
                      "Rooms", _roomsController, widget.rooms, 1),
                  const SizedBox(height: Insets.s),
                  _detailsPickCounter(
                      "Adults", _adultsController, widget.adults, 1),
                  const SizedBox(height: Insets.s),
                  _detailsPickCounter("Kids", _kidsController, widget.kids, 0),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => _onSelect(context),
              style: ElevatedButton.styleFrom(
                primary: InsetsColors.eButBackgroundColor,
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text("Select"),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _onSelect(BuildContext context) {
    int guest = _adultsController.number + _kidsController.number;
    setState(() {
      widget.rooms = _roomsController.number;
      if (widget.rooms > guest) {
        widget.adults = _adultsController.number + (widget.rooms - guest);
      } else {
        widget.adults = _adultsController.number;
      }
      widget.kids = _kidsController.number;
    });
    HomeShared.setRooms(widget.rooms);
    HomeShared.setAdults(widget.adults);
    HomeShared.setKids(widget.kids);
    Navigator.pop(context);
  }

  Widget _detailsPickCounter(
      String title, CounterController controller, int initValue, int minValue) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Expanded(
          flex: 2,
          child: Counter(
              initCount: initValue,
              minimalValue: minValue,
              controller: controller),
        ),
      ],
    );
  }

//Search button

  Widget _searchButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          final searchCryteria = SearchCryteria(
            location: widget.location!,
            timeRange: widget.dateRange!,
            rooms: widget.rooms,
            adults: widget.adults,
            kids: widget.kids,
          );
          if (widget.location != null && widget.dateRange != null) {
            Navigator.pushNamed(
              context,
              AppRoute.RESULTS_ROUTE,
              arguments: searchCryteria,
            );
            locator<AnaliticsService>()
                .LogSearch(widget.location!, searchCryteria);
          }
        },
        splashColor: InsetsColors.splashColor,
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 105, 105, 105),
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
