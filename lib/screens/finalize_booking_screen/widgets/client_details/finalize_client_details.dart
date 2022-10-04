import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/client_details/user_details_form.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';
import 'package:hotel_motel/theme/design_system.dart';

class FinalizeClientDetails extends StatelessWidget {
  const FinalizeClientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FinalizeHeader(label: "Client details"),
        const SizedBox(height: Insets.s),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(Insets.s),
          child: UserDetailsForm(),
        ),
      ],
    );
  }
}
