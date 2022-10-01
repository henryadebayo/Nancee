// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));
UserModelData? userModelDataFromJson(String str) =>
    UserModelData.fromJson(json.decode(str));

String? userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.phoneNumber,
    this.amoount,
    this.passWord,
    this.status,
    this.message,
    this.data,
  });
  String? phoneNumber;
  int? amoount;
  String? passWord;
  String? status;
  String? message;
  UserModelData? data;

  factory UserModel.fromJson(Map<String?, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: UserModelData.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserModelData {
  UserModelData({
    this.phoneNumber,
    this.amount,
    this.balance,
    this.created,
  });

  String? phoneNumber;
  int? amount;
  String? balance;
  DateTime? created;

  factory UserModelData.fromJson(Map<String?, dynamic> json) => UserModelData(
        phoneNumber: json["phoneNumber"],
        balance: json["balance"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "amount": amount,
        "balance": balance,
        "created": created!.toIso8601String(),
      };
}
