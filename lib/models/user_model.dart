class UserModel {
  final Map<String, dynamic> user;
  final String token;
  UserModel({required this.user, required this.token});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      user: jsonData['user'],
      token: jsonData['token'],
    );
  }
}
