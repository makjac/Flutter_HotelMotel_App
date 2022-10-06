import 'package:flutter/material.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/utils/paytment_methods_values.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';

import '../../../../theme/design_system.dart';

class FinalizePaytmentMethods extends StatefulWidget {
  const FinalizePaytmentMethods(
      {PaytmentMethodsValues? paytmentMethodsValues, super.key});

  @override
  State<FinalizePaytmentMethods> createState() =>
      _FinalizePaytmentMethodsState();
}

class _FinalizePaytmentMethodsState extends State<FinalizePaytmentMethods> {
  PaytmentMethodsValues _paytmentMethodsValues = PaytmentMethodsValues.inCash;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FinalizeHeader(label: "Paytment method"),
        const SizedBox(height: Insets.s),
        Container(
          padding: EdgeInsets.all(Insets.s),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              _radioButtom(
                PaytmentMethodsValues.inCash,
                Icon(Icons.attach_money_rounded),
                "In cash",
              ),
              _radioButtom(
                PaytmentMethodsValues.card,
                Icon(Icons.credit_card_rounded),
                "Card",
              ),
              _radioButtom(
                PaytmentMethodsValues.payPal,
                Icon(Icons.paypal_rounded),
                "PayPal",
              ),
              Row(
                children: <Widget>[],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _radioButtom(
      PaytmentMethodsValues paytmentValue, Icon icon, String title) {
    return RadioListTile(
      value: paytmentValue,
      groupValue: _paytmentMethodsValues,
      onChanged: (value) {
        setState(() {
          _paytmentMethodsValues = paytmentValue;
        });
      },
      title: Text(title),
      secondary: icon,
    );
  }
}
