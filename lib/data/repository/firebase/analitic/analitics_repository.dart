import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hotel_motel/data/repository/firebase/analitic/base_analitics_repository.dart';

class AnalyticsRepository extends BaseAnaliticsRepository {
  final FirebaseAnalytics _analitics = FirebaseAnalytics.instance;

  @override
  Future<void> setUserID(String uid) async {
    _analitics.setUserId(id: uid);
  }

  @override
  Future<void> loginLog(String loginMethod) async {
    await _analitics.logLogin(loginMethod: loginMethod);
  }

  @override
  Future<void> signupLog(String signUpMethod) async {
    await _analitics.logSignUp(signUpMethod: signUpMethod);
  }

  @override
  Future<void> measureScreenview(Map<String, Object?>? parameters) async {
    await _analitics.logEvent(
      name: 'screen_view',
      parameters: parameters,
    );
  }
}
