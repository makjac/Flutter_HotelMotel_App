import 'package:flutter/material.dart';

import '../../../utils/scale.dart';

typedef void DoubleCallback(double value);

class ReviewDetailsSlider extends StatefulWidget {
  final String label;
  double value;
  final DoubleCallback onChanged;

  ReviewDetailsSlider({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ReviewDetailsSlider> createState() => _ReviewDetailsSliderState();
}

class _ReviewDetailsSliderState extends State<ReviewDetailsSlider> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textScaleFactor: Scale.textScale(width, 2),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Slider.adaptive(
            value: widget.value,
            onChanged: (changedValue) => setState(() {
              widget.value = changedValue;
              widget.onChanged(changedValue);
            }),
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black26,
            label: "${widget.value.toInt()}",
          ),
        ),
      ],
    );
  }
}
