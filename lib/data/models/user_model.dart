class UserModel {
  final String? uid;
  final String? displayName;
  String? avatarUrl;
  UserModel({
    required this.uid,
    required this.displayName,
    this.avatarUrl,
  });
}
