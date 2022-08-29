import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsRepository {
  FirebaseAnalytics _analitics = FirebaseAnalytics.instance;

  Future<void> setUserID(String uid) async {
    try {
      _analitics.setUserId(id: uid);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> loginLog(String loginMethod) async {
    try {
      await _analitics.logLogin(loginMethod: loginMethod);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> measureScreenview(Map<String, Object?>? parameters) async {
    try {
      await _analitics.logEvent(
        name: 'screen_view',
        parameters: parameters,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
