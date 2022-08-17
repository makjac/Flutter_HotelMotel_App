import 'package:hotel_motel/data/models/search_details_model.dart';
import 'package:hotel_motel/data/models/thumbnail_room_model.dart';

class TestHotel {
  static List<HotelLite> hotels = [
    HotelLite(
      title: "Rezydencja Wind Rose - luxury ApartHotel",
      rating: 2.465,
      price: 120,
      isFreeCanceling: true,
    ),
    HotelLite(
      title: "Hotel Biedronka",
      rating: 4,
      price: 145.4,
      discount: 5,
      isFreeCanceling: false,
    ),
    HotelLite(
      title: "Zielona Gromada pod brzozą",
      rating: 1.3,
      price: 340,
      discount: 20,
      isFreeCanceling: true,
    ),
    HotelLite(
      title: "Sheraton Poznań",
      rating: 3.54,
      price: 1123.56,
      isFreeCanceling: false,
    ),
    HotelLite(
      title: "Hotel zielona róza",
      rating: 5,
      price: 500,
      discount: 15,
      isFreeCanceling: false,
    ),
    HotelLite(
      title: "zasiłkowy spot tymczasowy",
      rating: 0.1,
      price: 123,
      discount: 50,
      isFreeCanceling: true,
    ),
    HotelLite(
      title: "Rezydencja Wind Rose - luxury ApartHotel",
      rating: 2.465,
      price: 120,
      isFreeCanceling: true,
    ),
    HotelLite(
      title: "Hotel Biedronka",
      rating: 4,
      price: 145.4,
      discount: 5,
      isFreeCanceling: false,
    ),
    HotelLite(
      title: "Zielona Gromada pod brzozą",
      rating: 1.3,
      price: 340,
      discount: 20,
      isFreeCanceling: true,
    ),
    HotelLite(
      title: "Sheraton Poznań",
      rating: 3.54,
      price: 1123.56,
      isFreeCanceling: false,
    ),
    HotelLite(
      title: "Hotel zielona róza",
      rating: 5,
      price: 500,
      discount: 15,
      isFreeCanceling: false,
    ),
    HotelLite(
      title: "zasiłkowy spot tymczasowy",
      rating: 0.1,
      price: 123,
      discount: 50,
      isFreeCanceling: true,
    ),
  ];

  static List<SearchDetails> searchList = [
    SearchDetails(
      location: "Poznań",
      start: DateTime.now().add(const Duration(days: 3)),
      end: DateTime.now().add(const Duration(days: 6)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
    SearchDetails(
      location: "Gniezno",
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 9)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
    SearchDetails(
      location: "Bydgoszcz",
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 1)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
    SearchDetails(
      location: "Warszawa",
      start: DateTime.now().add(const Duration(days: 5)),
      end: DateTime.now().add(const Duration(days: 8)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
    SearchDetails(
      location: "Turek",
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 2)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
    SearchDetails(
      location: "Luboń",
      start: DateTime.now().add(const Duration(days: 2)),
      end: DateTime.now().add(const Duration(days: 12)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
    SearchDetails(
      location: "Szczecin",
      start: DateTime.now().add(const Duration(days: 30)),
      end: DateTime.now().add(const Duration(days: 33)),
      adults: 1,
      kids: 0,
      rooms: 1,
    ),
  ];
}
