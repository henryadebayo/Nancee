import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nannce/Repo/services/service_helpers/account_list_and_users_helper.dart';

import '../../Repo/models/transaction_history_model.dart';
import '../../Repo/models/user_model.dart';
import '../../Repo/services/get_account_list_and_users_services.dart';
import '../../Repo/services/transaction_history_service.dart';

part 'users_and_account_event.dart';
part 'users_and_account_state.dart';

class AccountHistoryBloc
    extends Bloc<AccoundHistroyEvent, AccountHistoryState> {
  AccountHistoryBloc() : super(InitialAccountState()) {
    on<AccoundHistroyEvent>((event, emit) async {
      if (event is LoadAccountHistoryEvent) {
        try {
          emit(AccountLoadingState());
          final TrasactionHistoryService trasactionHistoryService =
              TrasactionHistoryService();
          final accounthistory =
              await trasactionHistoryService.getTransactioHistory();

          emit(AccountHistoryLoaded(data: accounthistory));
        } on SocketException {
          emit(AccoundErrorState(
            errorMessage: "You Are Offline\n check internet connection",
          ));
        } catch (e) {
          emit(AccoundErrorState(
            errorMessage: e.toString(),
          ));
        }
      }
      if (event is LoadAccountUsersEvent) {
        try {
          emit(AccountLoadingState());

          final AccountListAndUserServices accountListAndUserServices =
              AccountListAndUserServices();

          final accountusers = await accountListAndUserServices.getAccountList(
              action: GetActionType.USERSLIST);

          emit(AccountUsersLoaded(data: accountusers!));
        } on SocketException {
          emit(AccoundErrorState(
            errorMessage: "You Are Offline\n check internet connection",
          ));
        } catch (e) {
          emit(AccoundErrorState(
            errorMessage: e.toString(),
          ));
        }
      }

      if (event is LoadAccountsEvent) {
        try {
          emit(AccountLoadingState());

          final AccountListAndUserServices accountListAndUserServices =
              AccountListAndUserServices();

          final accounts = await accountListAndUserServices.getAccountList(
              action: GetActionType.ACCOUNTLIST);

          emit(AccountsLoaded(data: accounts!));
        } on SocketException {
          emit(AccoundErrorState(
            errorMessage: "You Are Offline\n check internet connection",
          ));
        } catch (e) {
          emit(AccoundErrorState(
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
