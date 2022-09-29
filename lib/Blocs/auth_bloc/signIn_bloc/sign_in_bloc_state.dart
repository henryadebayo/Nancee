part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccessful extends SignInState {
  var user;
  SignInSuccessful({required this.user});
}

class SignInError extends SignInState {
  final String? errorMsg;
  SignInError({this.errorMsg});
}
