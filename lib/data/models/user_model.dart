class UserModel {
  String? uid;
  String? displayName;
  String? avatarUrl;
  UserModel({
    required this.uid,
    required this.displayName,
    this.avatarUrl,
  });
}
