part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent extends Equatable {}

class TransferEvent extends TransactionEvent {
  final String? accountNumber;
  var amount;

  TransferEvent({this.accountNumber, this.amount});

  @override
  List<Object?> get props => [accountNumber, amount];
}

class WithdrawEvent extends TransactionEvent {
  String? accountNumber;
  var amount;

  WithdrawEvent({this.accountNumber, this.amount});

  @override
  List<Object?> get props => [accountNumber, amount];
}
