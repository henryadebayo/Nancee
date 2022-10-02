part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccessful extends SignInState {
  String? message;
  SignInSuccessful({this.message});
}

class SignInError extends SignInState {
  String? errorMsg;
  SignInError({this.errorMsg});
}
