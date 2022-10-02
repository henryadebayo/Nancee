import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  UserModelData? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: UserModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserModelData {
  UserModelData({
    this.phoneNumber,
    this.created,
  });

  String? phoneNumber;
  DateTime? created;

  factory UserModelData.fromJson(Map<String, dynamic> json) => UserModelData(
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "created": created!.toIso8601String(),
      };
}
