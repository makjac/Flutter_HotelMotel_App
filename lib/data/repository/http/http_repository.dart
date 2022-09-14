import 'package:flutter/src/material/date.dart';
import 'package:hotel_motel/data/repository/http/base_http_repository.dart';
import 'package:hotel_motel/data/service/network_service/network_service.dart';
import 'package:hotel_motel/utils/time.dart';

class HttpRepository extends BaseHttpRepository {
  final NetworkService _networkService;
  HttpRepository({NetworkService? networkService})
      : _networkService = networkService ?? NetworkService();

  @override
  Future<int> getBookingColision(String roomID, DateTimeRange timerange) async {
    try {
      final bookingDetails = {
        "room_id": roomID,
        "start_time": Time.secondSinceEpoch(timerange.start).toString(),
        "end_time": Time.secondSinceEpoch(timerange.end).toString(),
      };

      return await _networkService.GetRoomBookingColisionNumber(bookingDetails);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
