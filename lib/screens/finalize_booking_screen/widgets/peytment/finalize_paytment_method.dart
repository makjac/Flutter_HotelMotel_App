import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';

class FinalizePaytmentMethods extends StatelessWidget {
  const FinalizePaytmentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[FinalizeHeader(label: "Paytment method")],
    );
  }
}
