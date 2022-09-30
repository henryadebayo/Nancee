import 'dart:convert';

AccountTransactionModel transferModelFromJson(String str) =>
    AccountTransactionModel.fromJson(json.decode(str));

String transferModelToJson(AccountTransactionModel data) =>
    json.encode(data.toJson());

class AccountTransactionModel {
  AccountTransactionModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  AccountTransactionModelData? data;

  factory AccountTransactionModel.fromJson(Map<String, dynamic> json) =>
      AccountTransactionModel(
        status: json["status"],
        message: json["message"],
        data: AccountTransactionModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class AccountTransactionModelData {
  AccountTransactionModelData({this.withdrawal, this.sent});

  int? withdrawal;
  int? sent;

  factory AccountTransactionModelData.fromJson(Map<String, dynamic> json) =>
      AccountTransactionModelData(
        withdrawal: json["withdrawal"],
        sent: json["sent"],
      );

  Map<String, dynamic> toJson() => {
        "withdrawal": withdrawal,
        "sent": sent,
      };
}
