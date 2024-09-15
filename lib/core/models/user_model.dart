import 'dart:convert';

class UserModel {
  String name;
  // int experience;
  // String license;
  String phone;
  String email;
  bool status;
  UserModel({
    required this.name,
    // required this.experience,
    // required this.license,
    required this.phone,
    required this.email,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      // 'experience': experience,
      // 'license': license,
      'phone': phone,
      'email': email,
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      // experience: map['experience'] as int,
      // license: map['license'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
