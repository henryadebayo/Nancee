import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nannce/Utils/const.dart';

class CreateAccountServices {
  late String endPoint;

  Future<dynamic> AccountAction(
    String phoneNumber,
    String passWord,
    ActionType actionType,
  ) async {
    try {
      final Map<String, dynamic> transfer = {
        "email": phoneNumber,
        "phoneNumber": passWord,
      };
      if (actionType == ActionType.TRANSFER) {
        endPoint = "accounts/withdraw";
      } else {
        endPoint = "accounts/transfer";
      }
      http.Response response = await http.post(Uri.parse("$BaseUrl/$endPoint"),
          body: json.encode(transfer));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print("THIS IS $actionType RESPONSE:::::${data}");
        return data;
      }
    } on SocketException {
      throw "Check Internet Connection";
    } catch (e) {
      print("THIS IS CREATE ACCONNT ERROR ::: ${e.toString()}");
      throw e;
    }
  }
}

enum ActionType { TRANSFER, WITHDRAW }
