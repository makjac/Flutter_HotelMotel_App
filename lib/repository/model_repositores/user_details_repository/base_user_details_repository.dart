import '../../../models/user_details.dart';

abstract class BaseUserDetailsRepository {
  Stream<UserDetails> getUserDetails(String userUid);

  Future<void> updateUserDetails(String userUid, UserDetails userDetails);
}
