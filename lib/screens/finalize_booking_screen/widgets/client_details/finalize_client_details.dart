import 'package:flutter/cupertino.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';

class FinalizeClientDetails extends StatelessWidget {
  const FinalizeClientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[FinalizeHeader(label: "Client details")],
    );
  }
}
