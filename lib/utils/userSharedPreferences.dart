// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class HomeShared {
  static late SharedPreferences _preferences;

  static const _keyLocation = 'search_location';
  static const _keyRoomsNum = 'rooms_number';
  static const _keyAdultsNum = 'adults_number';
  static const _keyKidsNum = 'kids_number';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //Search location
  static Future setLocation(String location) async =>
      await _preferences.setString(_keyLocation, location);

  static String? getLocation() => _preferences.getString(_keyLocation);

  //Search reserwation details
  //
  //rooms
  static Future steRooms(int count) async =>
      await _preferences.setInt(_keyRoomsNum, count);
  static int? getRoomsCount() => _preferences.getInt(_keyRoomsNum);
  //
  //adults
  static Future steAdults(int count) async =>
      await _preferences.setInt(_keyAdultsNum, count);
  static int? getAtultsCount() => _preferences.getInt(_keyAdultsNum);
  //
  //kids
  static Future steKids(int count) async =>
      await _preferences.setInt(_keyKidsNum, count);
  static int? getKidsCount() => _preferences.getInt(_keyKidsNum);
}
