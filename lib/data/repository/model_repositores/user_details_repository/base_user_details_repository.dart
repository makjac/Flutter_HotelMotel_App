import 'package:hotel_motel/data/models/user_details.dart';

abstract class BaseUserDetailsRepository {
  Stream<UserDetails> getUserDetails(String userUid);

  Future<bool> updateUserDetails(String userUid, UserDetails userDetails);
}
