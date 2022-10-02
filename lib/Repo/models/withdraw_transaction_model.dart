import 'dart:convert';

WithdrawTransactionModel withdrawTransactionModelFromJson(String str) =>
    WithdrawTransactionModel.fromJson(json.decode(str));

String withdrawTransactionModelToJson(WithdrawTransactionModel data) =>
    json.encode(data.toJson());

class WithdrawTransactionModel {
  WithdrawTransactionModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  WithdrawTransactionData? data;

  factory WithdrawTransactionModel.fromJson(Map<String, dynamic> json) =>
      WithdrawTransactionModel(
        status: json["status"],
        message: json["message"],
        data: WithdrawTransactionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class WithdrawTransactionData {
  WithdrawTransactionData({
    this.withdrawal,
  });

  int? withdrawal;

  factory WithdrawTransactionData.fromJson(Map<String, dynamic> json) =>
      WithdrawTransactionData(
        withdrawal: json["withdrawal"],
      );

  Map<String, dynamic> toJson() => {
        "withdrawal": withdrawal,
      };
}
