// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_motel/data/models/room_model.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/hotel_page_header.dart';

import '../../../theme/design_system.dart';

class HotelAmenities extends StatelessWidget {
  final Room room;
  const HotelAmenities({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelPageHeader(label: "Amenities"),
        const SizedBox(height: Insets.xs),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          runAlignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            room.facilities['airport_pickUp']
                ? _amenitiesLabel(
                    Icons.airplanemode_active_rounded, "Ariport pick-up", width)
                : _nullContainer(),
            room.facilities['car_rent']
                ? _amenitiesLabel(Icons.car_rental, "Car renting", width)
                : _nullContainer(),
            room.facilities['conference_facilities']
                ? _amenitiesLabel(
                    Icons.contact_phone, "Conference facilities", width)
                : _nullContainer(),
            room.facilities['cots']
                ? _amenitiesLabel(Icons.child_care, "Cots for children", width)
                : _nullContainer(),
            room.facilities['free_wifi']
                ? _amenitiesLabel(Icons.wifi, "Free wifi", width)
                : _nullContainer(),
            room.facilities['fridge']
                ? _amenitiesLabel(Icons.ac_unit, "In Room fridge", width)
                : _nullContainer(),
            room.facilities['in_room_safe']
                ? _amenitiesLabel(Icons.lock, "In Room Safe", width)
                : _nullContainer(),
            room.facilities['coffy_maker']
                ? _amenitiesLabel(
                    Icons.coffee_maker, "In Room coffy maker", width)
                : _nullContainer(),
            room.facilities['laundry_service']
                ? _amenitiesLabel(Icons.local_laundry_service_rounded,
                    "Laundry service", width)
                : _nullContainer(),
            room.facilities['pet_friendly']
                ? _amenitiesLabel(Icons.pets, "Pet friendly", width)
                : _nullContainer(),
            room.facilities['room_service']
                ? _amenitiesLabel(Icons.room_service, "Room service", width)
                : _nullContainer(),
            room.facilities['spa']
                ? _amenitiesLabel(Icons.spa, "Spa", width)
                : _nullContainer(),
            room.facilities['tv_in_room']
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
          ),
        ],
      ),
    );
  }
}
