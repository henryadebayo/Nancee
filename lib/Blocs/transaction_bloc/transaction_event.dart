part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class TransferEvent extends TransactionEvent {
  final String? accountNumber;
  var amount;

  TransferEvent({this.accountNumber, this.amount});
}

class WithdrawEvent extends TransactionEvent {
  String? accountNumber;
  var amount;

  WithdrawEvent({this.accountNumber, this.amount});
}
