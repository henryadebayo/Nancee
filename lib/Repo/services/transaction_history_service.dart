import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Utils/const.dart';
import '../models/transaction_history_model.dart';

class TrasactionHistoryService {
  Future<TransactionHistoryModel?> getTransactioHistory() async {
    try {
      http.Response response =
          await http.get(Uri.parse("$BaseUrl/transactions"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("This is response:::::::::: ${data.toString()}");
        return data;
      }
    } catch (e) {
      print("Failled this is error :::::::::: ${e.toString()}");
    }
  }
}
