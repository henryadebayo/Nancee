import 'package:get_it/get_it.dart';

import '../Repo/services/account_action_services.dart';
import '../Repo/services/auth_services.dart';
import '../Repo/services/get_account_list_and_users_services.dart';
import '../Repo/services/transaction_history_service.dart';

final getIt = GetIt.instance;

void netWork() {
  ///USECASE: MAKE WITHDRAWAL OR TRANSFER
  getIt.registerSingleton<AccountTransactionServices>(
      AccountTransactionServices());

  ///USECASE: SIGN IN / SIGN UP
  getIt.registerSingleton<AuthServices>(AuthServices());

  /// USECASE: GET USER / GET ACCOUNTS
  getIt.registerSingleton<AccountListAndUserServices>(
      AccountListAndUserServices());

  /// USECASE: GET TRANSACTION HISTORY
  getIt.registerSingleton<TrasactionHistoryService>(TrasactionHistoryService());
}
