import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nannce/Utils/const.dart';

import '../models/transfer_transaction_model.dart';
import '../models/withdraw_transaction_model.dart';

class AccountTransactionServices {
  Future<TransferTransactionModel?> transferTransction(
      {required String acccountNumber, var amount}) async {
    final Map<String, dynamic> userData = {
      "phoneNumber": acccountNumber,
      "amount": amount,
    };
    http.Response response = await http.post(
      Uri.parse("$BaseUrl/accounts/transfer"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(userData),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      var data = transferTransactionModelFromJson(response.body);

      return data;
    }
  }

  Future<WithdrawTransactionModel?> withdrawTransction(
      {required String acccountNumber, var amount}) async {
    final Map<String, dynamic> userData = {
      "phoneNumber": acccountNumber,
      "amount": amount,
    };
    http.Response response = await http.post(
      Uri.parse("$BaseUrl/accounts/withdraw"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(userData),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      var data = withdrawTransactionModelFromJson(response.body);

      return data;
    }
  }
}
