// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyUserUID = 'user_uid';
  static const _keyLocation = 'search_location';
  static const _keyStatTime = 'start_time';
  static const _keyEndTime = 'end_time';
  static const _keyRoomsNum = 'rooms_number';
  static const _keyAdultsNum = 'adults_number';
  static const _keyKidsNum = 'kids_number';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<bool> clear() async => _preferences.clear();

  //user
  static Future setUserUID(String uid) async =>
      await _preferences.setString(_keyUserUID, uid);

  static String? getUserUID() => _preferences.getString(_keyUserUID);

  //Search location
  static Future setLocation(String location) async =>
      await _preferences.setString(_keyLocation, location);

  static String? getLocation() => _preferences.getString(_keyLocation);

  //Search time range
  //
  //Start Time
  static Future setStartTime(int milisecondStamp) async =>
      await _preferences.setInt(_keyStatTime, milisecondStamp);
  static int? getStartTime() => _preferences.getInt(_keyStatTime);
  //End Time
  static Future setEndTime(int milisecondStamp) async =>
      await _preferences.setInt(_keyEndTime, milisecondStamp);
  static int? getEndTime() => _preferences.getInt(_keyEndTime);

  //Search reserwation details
  //
  //rooms
  static Future setRooms(int count) async =>
      await _preferences.setInt(_keyRoomsNum, count);
  static int? getRoomsCount() => _preferences.getInt(_keyRoomsNum);
  //
  //adults
  static Future setAdults(int count) async =>
      await _preferences.setInt(_keyAdultsNum, count);
  static int? getAtultsCount() => _preferences.getInt(_keyAdultsNum);
  //
  //kids
  static Future setKids(int count) async =>
      await _preferences.setInt(_keyKidsNum, count);
  static int? getKidsCount() => _preferences.getInt(_keyKidsNum);
}
