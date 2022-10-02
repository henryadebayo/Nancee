import 'dart:convert';

TransferTransactionModel transferTransactionModelFromJson(String str) =>
    TransferTransactionModel.fromJson(json.decode(str));

String transferTransactionModelToJson(TransferTransactionModel data) =>
    json.encode(data.toJson());

class TransferTransactionModel {
  TransferTransactionModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  TransferTransactionData? data;

  factory TransferTransactionModel.fromJson(Map<String, dynamic> json) =>
      TransferTransactionModel(
        status: json["status"],
        message: json["message"],
        data: TransferTransactionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class TransferTransactionData {
  TransferTransactionData({
    this.sent,
  });

  int? sent;

  factory TransferTransactionData.fromJson(Map<String, dynamic> json) =>
      TransferTransactionData(
        sent: json["sent"],
      );

  Map<String, dynamic> toJson() => {
        "sent": sent,
      };
}
