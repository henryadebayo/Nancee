part of 'users_and_account_bloc.dart';

@immutable
abstract class AccountHistoryState extends Equatable {
  const AccountHistoryState();
}

class InitialAccountState extends AccountHistoryState {
  @override
  List<Object?> get props => [];
}

class AccountLoadingState extends AccountHistoryState {
  @override
  List<Object?> get props => [];
}

class AccountHistoryLoaded extends AccountHistoryState {
  final List<TransactionHistoryData> data;
  AccountHistoryLoaded({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

class AccountUsersLoaded extends AccountHistoryState {
  final List<AccountAndUserAccountModelData> data;
  AccountUsersLoaded({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

class AccountsLoaded extends AccountHistoryState {
  final List<AccountAndUserAccountModelData> data;
  AccountsLoaded({required this.data}) : super();

  @override
  List<Object?> get props => [data];
}

class AccoundErrorState extends AccountHistoryState {
  final String errorMessage;
  AccoundErrorState({
    required this.errorMessage,
  }) : super();

  @override
  List<Object?> get props => [errorMessage];
}
