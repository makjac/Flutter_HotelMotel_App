import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_amenities.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_page_appbar.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_page_title.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_price_container.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/summary/hotel_summary.dart';

import '../../data/models/hotel_model.dart';
import '../../data/models/room_model.dart';
import '../../locator.dart';
import '../../theme/design_system.dart';
import '../../utils/scale.dart';
import '../results_screens/hotel_home_nav_argument.dart';
import 'bloc/hotel_page_bloc.dart';

class HotelPage extends StatefulWidget {
  final hotelPageArguments hotelArguments;
  const HotelPage({required this.hotelArguments, Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScroolUp = false;
  bool _readMore = false;

  @override
  void initState() {
    locator
        .get<HotelPageBloc>()
        .add(LoadHotelData(hotelID: widget.hotelArguments.hotelID));
    _scrollController.addListener(() {
      double showoffset = 250;
      if (_scrollController.offset > showoffset) {
        _showScroolUp = true;
        setState(() {});
      } else {
        _showScroolUp = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _showScroolUp ? _sctollBackToTopBut() : null,
        body: BlocBuilder<HotelPageBloc, HotelPageState>(
          builder: ((context, state) {
            if (state is LoadingHotelData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HotelDataLoaded) {
              return _loaded(width, state.hotel, state.rooms);
            }
            if (state is HotelPageError) {
              return Center(
                child: Text(state.error),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }

  Widget _loaded(double width, Hotel hotel, List<Room> rooms) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: false,
          pinned: true,
          delegate: HotelPageAppbar(),
        ),
        SliverToBoxAdapter(
          child: _content(width, hotel, rooms),
        ),
      ],
    );
  }

  Widget _content(double width, Hotel hotel, List<Room> rooms) {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HotelPageTitle(hotel: hotel),
          divider(),
          widget.hotelArguments.cryteria != null
              ? HotelPriceContainer(
                  priceUnit: rooms[0].price,
                  nights:
                      widget.hotelArguments.cryteria!.timeRange.duration.inDays,
                  roomCount: widget.hotelArguments.cryteria!.rooms,
                  adultsCount: 1,
                  kidsCount: 1,
                )
              : HotelPriceContainer(
                  priceUnit: rooms[0].price,
                  nights: 1,
                  roomCount: 1,
                  adultsCount: 1,
                  kidsCount: 1),
          const SizedBox(height: Insets.m),
          HotelSummary(hotel: hotel),
          HotelAmenities(room: rooms[0]),
          const SizedBox(height: Insets.m),
          _opinions(width)
        ],
      ),
    );
  }

  FloatingActionButton _sctollBackToTopBut() {
    return FloatingActionButton(
      onPressed: () {
        _scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      },
      backgroundColor: const Color.fromARGB(175, 0, 0, 0),
      child: const Icon(Icons.arrow_upward_rounded),
    );
  }

  Divider divider() => const Divider(
        color: Color.fromARGB(34, 36, 36, 36),
        thickness: 1,
        indent: 10,
        endIndent: 10,
        height: 40,
      );

  Text _header(String leabel, double width) {
    return Text(
      leabel,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      textScaleFactor: Scale.textScale(width, 1.5),
    );
  }

  Widget _opinions(double width) {
    return Column(
      children: [
        _header("Opinions", width),
      ],
    );
  }
}
