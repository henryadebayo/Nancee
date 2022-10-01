import 'package:flutter/material.dart';
import 'package:nannce/Repo/services/service_helpers/account_list_and_users_helper.dart';

import '../../Repo/services/get_account_list_and_users_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AccountListAndUserServices td = AccountListAndUserServices();
  @override
  void initState() {
    super.initState();
    td.getAccountList(action: GetActionType.ACCOUNTLIST);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
