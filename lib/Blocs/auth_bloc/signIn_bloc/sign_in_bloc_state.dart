part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class AuthSignInState {}

class SignInInitial extends AuthSignInState {}

class SignInLoading extends AuthSignInState {}

class SignedIn extends AuthSignInState {
  var user;
  SignedIn({required this.user});
}

class SignInError extends AuthSignInState {
  final String? errorMsg;
  SignInError({this.errorMsg});
}
