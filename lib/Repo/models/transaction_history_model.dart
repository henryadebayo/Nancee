import 'dart:convert';

TransactionHistoryModel TransactionHistoryModelFromJson(String str) =>
    TransactionHistoryModel.fromJson(json.decode(str));

String TransactionHistoryModelToJson(TransactionHistoryModel data) =>
    json.encode(data.toJson());

class TransactionHistoryModel {
  TransactionHistoryModel({
    this.status,
    this.data,
  });

  String? status;
  String? message;
  List<TransactionHistoryData>? data;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        status: json["status"],
        data: List<TransactionHistoryData>.from(
            json["data"].map((x) => TransactionHistoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TransactionHistoryData {
  TransactionHistoryData({
    this.type,
    this.amount,
    this.phoneNumber,
    required this.created,
    this.balance,
  });

  Type? type;
  int? amount;
  String? phoneNumber;
  DateTime created;
  int? balance;

  factory TransactionHistoryData.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryData(
        type: json["type"],
        amount: json["amount"],
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "phoneNumber": phoneNumber,
        "created": created.toIso8601String(),
        "balance": balance,
      };
}

enum Type { CREDIT, DEBIT }
