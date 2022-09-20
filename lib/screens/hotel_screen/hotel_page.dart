import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_motel/data/models/amenities_model.dart';
import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/hotel_screen/bloc/hotel_page_bloc.dart';
import 'package:hotel_motel/screens/results_screens/hotel_home_nav_argument.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/scale.dart';
import 'package:hotel_motel/widgets/score_bars/linear_score.dart';
import 'package:hotel_motel/widgets/score_bars/number_box.dart';

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
  final Amenities amenities = Amenities(
    airportPickUp: true,
    carRent: true,
    conferenceFacilities: true,
    cots: true,
    freeWifi: true,
    fridge: true,
    inRoomSafe: true,
    coffyMaker: true,
    laundryService: true,
    petFriendly: true,
    roomService: true,
    spa: true,
    tv: true,
  );

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
    return Scaffold(
      floatingActionButton: _showScroolUp ? _sctollBackToTopBut() : null,
      body: BlocBuilder<HotelPageBloc, HotelPageState>(
        builder: ((context, state) {
          if (state is LoadingHotelData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HotelDataLoaded) {
            return _LoadedPage(width, state.hotel, state.rooms);
          }
          return Container();
        }),
      ),
    );
  }

  Widget _LoadedPage(double width, Hotel hotel, List<Room> rooms) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(width, hotel),
                divider(),
                widget.hotelArguments.cryteria != null
                    ? _price(
                        rooms[0].price,
                        widget
                            .hotelArguments.cryteria!.timeRange.duration.inDays,
                        widget.hotelArguments.cryteria!.rooms,
                        1,
                        1,
                        width)
                    : _price(rooms[0].price, 1, 1, 1, 1, width),
                const SizedBox(height: Insets.m),
                _summary(width, hotel),
                _amenities(width, rooms),
                const SizedBox(height: Insets.m),
                _opinions(width)
              ],
            ),
          ),
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

  Widget _title(double width, Hotel hotel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotel.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                textScaleFactor: Scale.textScale(width, 1.5),
              ),
              const SizedBox(height: Insets.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    "${hotel.country}, ${hotel.city}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey),
                    textScaleFactor: Scale.textScale(width, 1.5),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: NumberBox(
              number: (hotel.rating / 100) * 5,
              textPadding: 5,
              textScale: 1.3,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _stars(double width, num rating) {
    return RatingBar(
      itemCount: 5,
      initialRating: (rating / 100) * 5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 25 * Scale.textScale(width, 1.3),
      ratingWidget: RatingWidget(
        empty: Icon(Icons.star_border_rounded, color: Colors.amber[100]),
        half: Icon(Icons.star_half_rounded, color: Colors.amber[300]),
        full: Icon(Icons.star_rounded, color: Colors.amber[600]),
      ),
      onRatingUpdate: (value) {},
    );
  }

  Widget _price(num priceUnit, int nights, int roomCount, int adultsCount,
      int? kidsCount, double width) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Colors.grey,
              offset: Offset(7, 7))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price for $nights nights, $roomCount rooms",
                    textScaleFactor: Scale.textScale(width, 1.3),
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: Insets.xs),
                  Text(
                    //todo: set room name
                    "Deluxe",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textScaleFactor: Scale.textScale(width, 1.5),
                  ),
                  const SizedBox(height: Insets.xs),
                  Text(
                    "PLN ${priceUnit * nights}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                    textScaleFactor: Scale.textScale(width, 1.5),
                  ),
                  const SizedBox(height: Insets.xs),
                  Text(
                    "Includes fees and taxes",
                    textScaleFactor: Scale.textScale(width, 1.3),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _summary(double width, Hotel hotel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header("Summary", width),
        const SizedBox(height: Insets.s),
        _hotelScore(width, hotel),
        const SizedBox(height: Insets.s),
        Text(
          hotel.description,
          //"Hotel Traffic Poznań Stare Miasto zlokalizowany jest w centrum Poznania. Dysponuje on pokojami z bezpłatnym WiFi oraz czynną przez całą dobę recepcją. Obiekt Hotel Altus Poznań Old Town, położony w miejscowości Poznań, oferuje usługę błyskawicznego zameldowania i wymeldowania, zakwaterowanie w pokojach dla alergików, centrum fitness, bezpłatne WiFi...",
          textAlign: TextAlign.justify,
          overflow: _readMore ? null : TextOverflow.ellipsis,
          textScaleFactor: Scale.textScale(width, 1.3),
          maxLines: _readMore ? null : 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  _readMore = !_readMore;
                  setState(() {});
                },
                child: Text(_readMore ? "Show less" : "Show more")),
          ],
        )
      ],
    );
  }

  Widget _hotelScore(double width, Hotel hotel) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberBox(
              number: (hotel.rating / 100) * 5,
              textPadding: 5,
              textScale: 1.1,
              color: Colors.black,
            ),
            const SizedBox(width: Insets.xs),
            _stars(width, hotel.rating),
          ],
        ),
        const SizedBox(height: Insets.xs),
        _scoreLabel("Czystość", hotel.score['purity'] as num, width),
        _scoreLabel("Komfort", hotel.score['comfort'] as num, width),
        _scoreLabel("Udogodnienia", hotel.score['facilities'] as num, width),
        _scoreLabel("Personel", hotel.score['staff'] as num, width),
        _scoreLabel("Lokalizacja", hotel.score['location'] as num, width),
        _scoreLabel("Cena", hotel.score['price'] as num, width),
      ],
    );
  }

  Widget _scoreLabel(String label, num score, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          Expanded(
            flex: 9,
            child: LinearScoreBar(
              value: score,
              minHeight: 15,
              mainColor: Colors.black,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _amenities(double width, List<Room> rooms) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header("Amenities", width),
        const SizedBox(height: Insets.xs),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          runAlignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            rooms[0].facilities['airport_pickUp']
                ? _amenitiesLabel(
                    Icons.airplanemode_active_rounded, "Ariport pick-up", width)
                : _nullContainer(),
            rooms[0].facilities['car_rent']
                ? _amenitiesLabel(Icons.car_rental, "Car renting", width)
                : _nullContainer(),
            rooms[0].facilities['conference_facilities']
                ? _amenitiesLabel(
                    Icons.contact_phone, "Conference facilities", width)
                : _nullContainer(),
            rooms[0].facilities['cots']
                ? _amenitiesLabel(Icons.child_care, "Cots for children", width)
                : _nullContainer(),
            rooms[0].facilities['free_wifi']
                ? _amenitiesLabel(Icons.wifi, "Free wifi", width)
                : _nullContainer(),
            rooms[0].facilities['fridge']
                ? _amenitiesLabel(Icons.ac_unit, "In Room fridge", width)
                : _nullContainer(),
            rooms[0].facilities['in_room_safe']
                ? _amenitiesLabel(Icons.lock, "In Room Safe", width)
                : _nullContainer(),
            rooms[0].facilities['coffy_maker']
                ? _amenitiesLabel(
                    Icons.coffee_maker, "In Room coffy maker", width)
                : _nullContainer(),
            rooms[0].facilities['laundry_service']
                ? _amenitiesLabel(Icons.local_laundry_service_rounded,
                    "Laundry service", width)
                : _nullContainer(),
            rooms[0].facilities['pet_friendly']
                ? _amenitiesLabel(Icons.pets, "Pet friendly", width)
                : _nullContainer(),
            rooms[0].facilities['room_service']
                ? _amenitiesLabel(Icons.room_service, "Room service", width)
                : _nullContainer(),
            rooms[0].facilities['spa']
                ? _amenitiesLabel(Icons.spa, "Spa", width)
                : _nullContainer(),
            rooms[0].facilities['tv_in_room']
                ? _amenitiesLabel(Icons.tv, "Ariport pick-up", width)
                : _nullContainer(),
          ],
        )
      ],
    );
  }

  Widget _nullContainer() => Container(width: 0.001, height: 0.001);

  Widget _amenitiesLabel(IconData icons, String label, double width) {
    return SizedBox(
      width: 170,
      child: Row(
        children: [
          Icon(icons),
          const SizedBox(width: Insets.xs),
          Text(
            label,
            //style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
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
