class UserProfileModel {
  final String? id;
  final String name;
  final String email;
  final String? role;
  final String semester;
  final String? stage;
  final String subject;

  UserProfileModel({
    this.id,
    required this.name,
    required this.email,
    this.role,
    required this.semester,
    this.stage,
    required this.subject,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      role: json["role"],
      semester: json["semester"] ?? "",
      stage: json["stage"] ?? "",
      subject: json["subject"] ?? "",
    );
  }
}
