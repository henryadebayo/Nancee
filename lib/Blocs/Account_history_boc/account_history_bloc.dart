import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repo/services/transaction_history_service.dart';

part 'account_history_event.dart';
part 'account_history_state.dart';

class AccountHistoryBloc
    extends Bloc<AccoundHistroyEvent, AccountHistoryState> {
  AccountHistoryBloc() : super(InitialAccountHistoryState()) {
    on<LoadAccountHistoryEvent>((event, emit) async {
      if (event is LoadAccountHistoryEvent) {
        try {
          emit(LoadingAccountHistoryState());
          final TrasactionHistoryService trasactionHistoryService =
              TrasactionHistoryService();
          final accounthistory =
              trasactionHistoryService.getTransactioHistory();
          emit(AccountHistoryLoaded(data: accounthistory));
        } on SocketException {
          emit(AccoundHistroyError(
            errorMessage: "You Are Offline\n check internet connection",
          ));
        } catch (e) {
          emit(AccoundHistroyError(
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
