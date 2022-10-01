import 'package:http/http.dart' as http;

import '../../Utils/const.dart';
import '../models/transaction_history_model.dart';

class TrasactionHistoryService {
  Future<List<TransactionHistoryData>?> getTransactioHistory() async {
    try {
      http.Response response =
          await http.get(Uri.parse("$BaseUrl/transactions"));
      if (response.statusCode == 200) {
        var data = TransactionHistoryModelFromJson(response.body);
        print("This is response:::::::::: ${data.toString()}");

        final List<TransactionHistoryData> payLoad = data.data!;

        print("This is TransactionHistory:::::::::: ${payLoad}");

        return payLoad;
      }
    } catch (e) {
      print("Failed this is error :::::::::: ${e.toString()}");
    }
  }
}
