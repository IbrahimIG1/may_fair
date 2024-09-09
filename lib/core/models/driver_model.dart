import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DriverModel {
  String name;
  int experience;
  String license;
  String phone;
  String email;
  DriverModel({
    required this.name,
    required this.experience,
    required this.license,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'experience': experience,
      'license': license,
      'phone': phone,
      'email': email,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      name: map['name'] as String,
      experience: map['experience'] as int,
      license: map['license'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) => DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
