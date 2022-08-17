import 'package:shared_preferences/shared_preferences.dart';

class HomeShared {
  static late SharedPreferences _preferences;

  static const _keyLocation = 'search_location';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //Search location
  static Future setLocation(String location) async =>
      await _preferences.setString(_keyLocation, location);

  static String? getLocation() => _preferences.getString(_keyLocation);
}
