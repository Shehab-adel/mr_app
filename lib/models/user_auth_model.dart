class UserAuthModel {
  final String id;
  final String name;
  final String email;
  final String token;

  UserAuthModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      token: json["token"],
    );
  }
}
