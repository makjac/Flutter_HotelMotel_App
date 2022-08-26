import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/data/repository/fb_auth_repository.dart';
import 'package:hotel_motel/locator.dart';

class UserController {
  UserModel? _currentUser;
  final AuthRepository _authRepo = locator.get<AuthRepository>();
  late Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel?> initUser() async {
    _currentUser = await _authRepo.getUser();
    return _currentUser;
  }

  UserModel? get currentUser => _currentUser;
}
