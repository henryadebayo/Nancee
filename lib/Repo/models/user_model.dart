// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.phoneNumber,
    this.passWord,
    this.status,
    this.message,
    this.data,
  });
  String? phoneNumber;
  String? passWord;
  String? status;
  String? message;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.phoneNumber,
    this.created,
  });

  String? phoneNumber;
  DateTime? created;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "created": created!.toIso8601String(),
      };
}
