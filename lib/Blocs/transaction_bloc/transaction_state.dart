part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState {
  const TransactionState();
}

class InitialTransactionState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransferTransactionSuccesful extends TransactionState {
  String message;
  TransferTransactionSuccesful({required this.message}) : super();
}

class WithdrawTransactionSuccesful extends TransactionState {
  String message;
  WithdrawTransactionSuccesful({required this.message}) : super();
}

class TransactionErrorState extends TransactionState {
  String errorMessage;
  TransactionErrorState({
    required this.errorMessage,
  }) : super();
}
