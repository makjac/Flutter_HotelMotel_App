import 'package:flutter/material.dart';

abstract class BaseHttpRepository {
  Future<int> getBookingColision(String roomID, DateTimeRange timerange);
}
