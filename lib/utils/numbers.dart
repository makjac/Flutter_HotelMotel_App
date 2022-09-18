import 'package:flutter/material.dart';

class Numbers {
  static bool isNumberInRange(num number, RangeValues range) {
    return range.start <= number && number <= range.end;
  }
}
