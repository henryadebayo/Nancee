import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../Repo/services/account_action_services.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(InitialTransactionState()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransferEvent) {
        try {
          emit(TransactionLoadingState());
          final AccountTransactionServices accountTransactionServices =
              AccountTransactionServices();
          final transaction =
              await accountTransactionServices.transferTransction(
                  acccountNumber: event.accountNumber!, amount: event.amount);

          emit(TransferTransactionSuccesful(message: transaction!.message!));
          // emit(InitialTransactionState());
        } on SocketException {
          emit(const TransactionErrorState(
            errorMessage: "You Are Offline\n check internet connection",
          ));
        } catch (e) {
          emit(TransactionErrorState(
            errorMessage: e.toString(),
          ));
        }
      }
      if (event is WithdrawEvent) {
        try {
          emit(TransactionLoadingState());

          final AccountTransactionServices accountTransactionServices =
              AccountTransactionServices();
          final transaction =
              await accountTransactionServices.withdrawTransction(
                  acccountNumber: event.accountNumber!, amount: event.amount);

          emit(WithdrawTransactionSuccesful(message: transaction!.message!));
        } on SocketException {
          emit(const TransactionErrorState(
            errorMessage: "You Are Offline\n check internet connection",
          ));
        } catch (e) {
          emit(TransactionErrorState(
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
