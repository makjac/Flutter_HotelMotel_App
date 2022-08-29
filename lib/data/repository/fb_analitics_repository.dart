import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsRepository {
  FirebaseAnalytics _analitics = FirebaseAnalytics.instance;

  Future<void> setUserID(String uid) async {
    try {} catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> measureScreenview(Map<String, Object?>? parameters) async {
    await _analitics.logEvent(
      name: 'screen_view',
      parameters: parameters,
    );
  }
}
