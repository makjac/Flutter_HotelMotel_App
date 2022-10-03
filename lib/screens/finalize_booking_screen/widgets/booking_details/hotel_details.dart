import 'package:flutter/cupertino.dart';

import 'package:hotel_motel/data/models/hotel_model.dart';

import '../../../../theme/design_system.dart';

class HotelDetails extends StatelessWidget {
  final Hotel hotel;
  const HotelDetails({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Hotel:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: Insets.xs),
        Text(
          hotel.name,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 3),
        Text(
            "${hotel.city}, ${hotel.zipcode.substring(0, 2)}-${hotel.zipcode.substring(1, 4)},"),
        const SizedBox(height: 1),
        Text("${hotel.street} ${hotel.buildingNumber} ${hotel.localNumber}")
      ],
    );
  }
}
