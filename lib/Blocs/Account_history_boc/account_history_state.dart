part of 'account_history_bloc.dart';

@immutable
abstract class AccountHistoryState {
  const AccountHistoryState();
}

class InitialAccountHistoryState extends AccountHistoryState {}

class LoadingAccountHistoryState extends AccountHistoryState {}

class AccountHistoryLoaded extends AccountHistoryState {
  var data;
  AccountHistoryLoaded({required this.data}) : super();
}

class AccoundHistroyError extends AccountHistoryState {
  String errorMessage;
  AccoundHistroyError({
    required this.errorMessage,
  }) : super();
}
