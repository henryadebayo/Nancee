import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nannce/Utils/const.dart';

import '../models/acccount_transaction_model.dart';

class AccountTransactionServices {
  late String endPoint;

  Future<AccountTransactionModel?> CreateTransaction(
    String phoneNumber,
    String passWord,
    ActionType actionType,
  ) async {
    final Map<String, dynamic> transfer = {
      "email": phoneNumber,
      "phoneNumber": passWord,
    };
    if (actionType == ActionType.TRANSFER) {
      endPoint = "accounts/transfer";
    } else {
      endPoint = "accounts/withdraw";
    }
    http.Response response = await http.post(Uri.parse("$BaseUrl/$endPoint"),
        body: json.encode(transfer));

    if (response.statusCode == 200) {
      var data = transferModelFromJson(response.body);
      print("THIS IS $actionType RESPONSE:::::${data}");
      return data;
    }
  }
}

enum ActionType { TRANSFER, WITHDRAW }
