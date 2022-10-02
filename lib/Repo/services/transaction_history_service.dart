import 'package:http/http.dart' as http;

import '../../Utils/const.dart';
import '../models/transaction_history_model.dart';

class TrasactionHistoryService {
  Future<List<TransactionHistoryData>> getTransactioHistory() async {
    http.Response response = await http.get(Uri.parse("$BaseUrl/transactions"));

    if (response.statusCode == 200) {
      var data = transactionHistoryModelFromJson(response.body);
      print(data);
      final List<TransactionHistoryData> payLoad = data.data!;
      return payLoad;
    }
    throw ("error loading data");
  }
}
