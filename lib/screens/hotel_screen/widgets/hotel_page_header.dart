import 'package:flutter/cupertino.dart';

import '../../../utils/scale.dart';

class HotelPageHeader extends StatelessWidget {
  final String label;
  const HotelPageHeader({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      textScaleFactor: Scale.textScale(width, 1.5),
    );
  }
}
