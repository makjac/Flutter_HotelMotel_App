abstract class BaseAnaliticsRepository {
  Future<void> setUserID(String uid);

  Future<void> loginLog(String loginMethod);

  Future<void> measureScreenview(Map<String, Object?>? parameters);
}
