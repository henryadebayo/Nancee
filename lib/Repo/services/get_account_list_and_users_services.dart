import 'package:http/http.dart' as http;
import 'package:nannce/Repo/models/user_model.dart';
import 'package:nannce/Repo/services/service_helpers/account_list_and_users_helper.dart';

import '../../Utils/const.dart';

class AccountListAndUserServices {
  late String _endpoint;
  List<UserModel> payLoadList = [];

  Future<List<UserModelData>?> getAccountList(
      {required GetActionType action}) async {
    try {
      if (action == GetActionType.ACCOUNTLIST) {
        _endpoint = "accounts/list";
      } else {
        _endpoint = "auth/users";
      }
      http.Response response = await http.get(Uri.parse("$BaseUrl/$_endpoint"));
      if (response.statusCode == 200) {
        var data = userModelDataFromJson(response.body);
        print("This is response:::::::::: ${data.toString()}");

        final List<UserModelData> payLoad = data as List<UserModelData>;

        print(
            "This is Action payload response:::::::::: ${payLoadList.toString()}");

        return payLoad;
      }
    } catch (e) {
      print("THIS IS GETACCOUNTLIST ERROR ${e.toString()}");
    }
  }
}
