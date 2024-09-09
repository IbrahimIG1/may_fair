
import 'dart:convert';

class Customer {
  String userName;
  String phone;
  Customer({
    required this.userName,
    required this.phone,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'phone': phone,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      userName: map['userName'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);
}
