part of 'account_history_bloc.dart';

@immutable
abstract class AccoundHistroyEvent {}

class LoadAccountHistoryEvent extends AccoundHistroyEvent {}

class LoadAccountUsersEvent extends AccoundHistroyEvent {}

class LoadAccountsEvent extends AccoundHistroyEvent {}
