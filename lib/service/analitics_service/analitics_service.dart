import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';

class AnaliticsService {
  final FirebaseAnalytics _analytics;

  AnaliticsService({
    FirebaseAnalytics? analytics,
  }) : _analytics = analytics ?? FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future setUserProporties({required String userId}) async {
    await _analytics.setUserId(id: userId);
  }
}
