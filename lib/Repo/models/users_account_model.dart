import 'dart:convert';

AccountsModel accountsModelFromJson(String str) =>
    AccountsModel.fromJson(json.decode(str));

String accountsModelToJson(AccountsModel data) => json.encode(data.toJson());

class AccountsModel {
  AccountsModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<UsersAcountData>? data;

  factory AccountsModel.fromJson(Map<String, dynamic> json) => AccountsModel(
        status: json["status"],
        message: json["message"],
        data: List<UsersAcountData>.from(
            json["data"].map((x) => UsersAcountData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UsersAcountData {
  UsersAcountData({
    this.phoneNumber,
    this.balance,
    this.created,
  });

  String? phoneNumber;
  int? balance;
  DateTime? created;

  factory UsersAcountData.fromJson(Map<String, dynamic> json) =>
      UsersAcountData(
        phoneNumber: json["phoneNumber"],
        balance: json["balance"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "balance": balance,
        "created": created!.toIso8601String(),
      };
}
