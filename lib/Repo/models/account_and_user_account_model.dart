import 'dart:convert';

AccountAndUserAccountModel? accountuserModelFromJson(String str) =>
    AccountAndUserAccountModel.fromJson(json.decode(str));

AccountAndUserAccountModelData? accountuserModelDataFromJson(String str) =>
    AccountAndUserAccountModelData.fromJson(json.decode(str));

String? userModelToJson(AccountAndUserAccountModel data) =>
    json.encode(data.toJson());

class AccountAndUserAccountModel {
  AccountAndUserAccountModel({
    this.status,
    this.message,
    this.data,
  });
  String? status;
  String? message;
  List<AccountAndUserAccountModelData>? data;

  factory AccountAndUserAccountModel.fromJson(Map<String, dynamic> json) =>
      AccountAndUserAccountModel(
        status: json["status"],
        message: json["message"],
        data: List<AccountAndUserAccountModelData>.from(json["data"]
            .map((x) => AccountAndUserAccountModelData.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AccountAndUserAccountModelData {
  AccountAndUserAccountModelData({
    this.phoneNumber,
    this.balance,
    this.created,
  });

  String? phoneNumber;
  var balance;
  DateTime? created;

  factory AccountAndUserAccountModelData.fromJson(Map<String, dynamic> json) =>
      AccountAndUserAccountModelData(
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
