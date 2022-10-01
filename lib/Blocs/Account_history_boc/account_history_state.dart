part of 'account_history_bloc.dart';

@immutable
abstract class AccountHistoryState {
  const AccountHistoryState();
}

class InitialAccountState extends AccountHistoryState {}

class AccountLoadingState extends AccountHistoryState {}

class AccountHistoryLoaded extends AccountHistoryState {
  List<TransactionHistoryData> data;
  AccountHistoryLoaded({required this.data}) : super();
}

class AccountUsersLoaded extends AccountHistoryState {
  List<UserModelData> data;
  AccountUsersLoaded({required this.data}) : super();
}

class AccountsLoaded extends AccountHistoryState {
  List<UserModelData> data;
  AccountsLoaded({required this.data}) : super();
}

class AccoundErrorState extends AccountHistoryState {
  String errorMessage;
  AccoundErrorState({
    required this.errorMessage,
  }) : super();
}
