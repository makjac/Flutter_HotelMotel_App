// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LinearScoreBar extends StatelessWidget {
  final num value;
  final double? minHeight;
  final Color? mainColor;
  final Color? backgroundColor;

  const LinearScoreBar({
    Key? key,
    this.value = 0,
    this.minHeight,
    this.mainColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value / 100,
      color: mainColor,
      minHeight: minHeight,
      backgroundColor: backgroundColor,
    );
  }
}
