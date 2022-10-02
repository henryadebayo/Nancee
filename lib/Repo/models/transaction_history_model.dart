import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) =>
    TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) =>
    json.encode(data.toJson());

class TransactionHistoryModel {
  TransactionHistoryModel({
    this.status,
    this.data,
  });

  String? status;
  List<TransactionHistoryData>? data;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<TransactionHistoryData>.from(
                json["data"].map((x) => TransactionHistoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TransactionHistoryData {
  TransactionHistoryData({
    this.type,
    this.amount,
    this.phoneNumber,
    this.created,
    this.balance,
  });

  String? type;
  double? amount;
  String? phoneNumber;
  DateTime? created;
  double? balance;

  factory TransactionHistoryData.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryData(
        type: json["type"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        balance: json["balance"] == null ? null : json["balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount == null ? null : amount,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "created": created == null ? null : created?.toIso8601String(),
        "balance": balance == null ? null : balance,
      };
}
