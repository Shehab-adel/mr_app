class UserAuthModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String token;
  final String? stage; // المرحلة (ابتدائي، إعدادي، ثانوي)
  final String? semester; // الفصل الدراسي
  final String? subject; // المادة

  UserAuthModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.token,
    this.stage,
    this.semester,
    this.subject,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      role: json["role"] ?? "student",
      token: json["token"] ?? "",
      stage: json["stage"],
      semester: json["semester"],
      subject: json["subject"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "role": role,
      "token": token,
      "stage": stage,
      "semester": semester,
      "subject": subject,
    };
  }

  UserAuthModel copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? token,
    String? stage,
    String? semester,
    String? subject,
  }) {
    return UserAuthModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      token: token ?? this.token,
      stage: stage ?? this.stage,
      semester: semester ?? this.semester,
      subject: subject ?? this.subject,
    );
  }
}
