import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.phoneNumber,
    this.amount,
    this.password,
  });

  String? phoneNumber;
  int? amount;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phoneNumber"],
        amount: json["amount"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "amount": amount,
        "password": password,
      };
}
