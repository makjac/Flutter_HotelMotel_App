import 'package:hotel_motel/data/service/network_service/base_network_service.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService extends BaseNetworkService {
  final _baseUrl = "us-central1-hotelmotel-66527.cloudfunctions.net";

  @override
  Future<int> GetRoomBookingColisionNumber(
      Map<String, String> bookingDetails) async {
    try {
      final snapshot = await http.get(
          Uri.http(_baseUrl, "/app/api/booking/get_number_of_collisions"),
          headers: bookingDetails);
      if (await snapshot.statusCode == 200) {
        final reponse = await jsonDecode(snapshot.body);
        print(reponse['length']);
        return await reponse["length"];
      } else {
        throw Exception("status ${snapshot.statusCode}");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
