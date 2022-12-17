// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hotel_motel/models/hotel_model.dart';
import 'package:hotel_motel/models/room_model.dart';

import '../../../models/search_cryteria.dart';

class FinalizeBookingArguments {
  SearchCryteria? cryteria;
  final Hotel hotel;
  final Room room;

  FinalizeBookingArguments({
    this.cryteria,
    required this.hotel,
    required this.room,
  });
}
