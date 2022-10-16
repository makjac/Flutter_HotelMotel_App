import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class AppDivider extends StatelessWidget {
  final Color _color;
  final double _height;
  final double _width;
  const AppDivider(
      {Color? color, double? height, double? width, double? padding, super.key})
      : _color = color ?? Colors.black12,
        _height = height ?? Insets.xs,
        _width = width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Container(
        color: _color,
        height: _height,
        width: _width,
      ),
    );
  }
}
