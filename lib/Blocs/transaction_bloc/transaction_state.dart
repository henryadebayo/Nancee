part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState extends Equatable {
  const TransactionState();
}

class InitialTransactionState extends TransactionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransactionLoadingState extends TransactionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransferTransactionSuccesful extends TransactionState {
  final String message;
  const TransferTransactionSuccesful({required this.message}) : super();

  @override
  List<Object?> get props => [message];
}

class WithdrawTransactionSuccesful extends TransactionState {
  final String message;
  const WithdrawTransactionSuccesful({required this.message}) : super();

  @override
  List<Object?> get props => [message];
}

class TransactionErrorState extends TransactionState {
  final String errorMessage;
  const TransactionErrorState({
    required this.errorMessage,
  }) : super();

  @override
  List<Object?> get props => [errorMessage];
}
