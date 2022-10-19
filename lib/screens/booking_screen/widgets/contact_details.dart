// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hotel_motel/data/models/hotel_model.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class ContactDetails extends StatelessWidget {
  final Hotel hotel;
  const ContactDetails({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _adres(),
          const SizedBox(height: Insets.s),
          _contact(),
        ],
      ),
    );
  }

  Widget _adres() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Icon(Icons.location_city),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Adres:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: Insets.xs),
              Text(
                "${hotel.street} ${hotel.buildingNumber} ${hotel.localNumber}, ${hotel.zipcode} ${hotel.city}, ${hotel.country}",
                style: TextStyle(fontWeight: FontWeight.w500),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _contact() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Icon(Icons.contact_phone),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contact:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: Insets.xs),
              _contactElement(Icons.email, "Email:", hotel.Email),
              _contactElement(Icons.phone, "Phone:",
                  "+${hotel.PhonePrefix} ${hotel.PhoneNumber}"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contactElement(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
        ),
        const SizedBox(width: Insets.xs),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const SizedBox(width: Insets.xs),
        Text(
          value,
        )
      ],
    );
  }
}
