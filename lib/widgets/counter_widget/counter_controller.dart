// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier {
  int number = 0;

  void setValue(int value) {
    number = value;
    notifyListeners();
  }
}
