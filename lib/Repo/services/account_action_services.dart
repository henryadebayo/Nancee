import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nannce/Utils/const.dart';

import '../models/acccount_transaction_model.dart';
import 'service_helpers/account_action_helper.dart';

class AccountTransactionServices {
  late String? _endPoint;

  Future<AccountTransactionModel?> createTransaction(
    String? phoneNumber,
    int? amount,
    ActionType? actionType,
  ) async {
    try {
      print("This Was Called ");
      final Map<String, dynamic> transfer = {
        "phoneNumber": phoneNumber,
        "amount": amount,
      };
      // if (actionType == ActionType.TRANSFER) {
      //   _endPoint = "accounts/transfer";
      // } else {
      //   _endPoint = "accounts/withdraw";
      // }
      // ;
      // print(transfer.toString());
      http.Response response = await http.post(
          Uri.parse("$BaseUrl/accounts/transfer"),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: json.encode(transfer));
      if (response.statusCode == 200) {
        var data = transferModelFromJson(response.body);
        print("THIS IS $actionType RESPONSE:::::${data}");
        return data;
      }
    } on SocketException {
      print("Check internet connection");
    } catch (e) {
      "THIS IS ACOUNT ACTION ERROR ::::::: ${e.toString()}";
    }
  }
}
