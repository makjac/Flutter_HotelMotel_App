import 'package:firebase_analytics/firebase_analytics.dart';

import '../../models/search_cryteria.dart';

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

  Future LoginLog() async {
    await _analytics.logLogin(loginMethod: 'emial');
  }

  Future LogSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'emial');
  }

  Future LogSearch(String searchTerm, SearchCryteria searchCryteria) async {
    await _analytics.logSearch(
      searchTerm: searchTerm,
      destination: searchCryteria.location,
      numberOfNights: searchCryteria.timeRange.duration.inDays,
      startDate: searchCryteria.timeRange.start.toString(),
      endDate: searchCryteria.timeRange.end.toString(),
      numberOfRooms: searchCryteria.rooms,
      numberOfPassengers: searchCryteria.adults + searchCryteria.kids,
    );
  }
}
