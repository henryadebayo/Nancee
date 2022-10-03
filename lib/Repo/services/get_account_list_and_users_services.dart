import 'package:http/http.dart' as http;
import 'package:nannce/Repo/models/account_and_user_account_model.dart';
import 'package:nannce/Repo/services/service_helpers/account_list_and_users_helper.dart';

import '../../Utils/const.dart';

class AccountListAndUserServices {
  late String _endpoint;

  Future<List<AccountAndUserAccountModelData>?> getAccountList(
      {required GetActionType action}) async {
    if (action == GetActionType.ACCOUNTLIST) {
      _endpoint = "accounts/list";
    } else {
      _endpoint = "auth/users";
    }
    http.Response response = await http.get(Uri.parse("$BaseUrl/$_endpoint"));

    if (response.statusCode == 200) {
      var data = accountuserModelFromJson(response.body);
      List<AccountAndUserAccountModelData>? payLoad = data!.data;

      return payLoad;
    }
  }
}
