part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignUpBlocState {}

class SignupBlocInitial extends SignUpBlocState {}

class SignUpLoading extends SignUpBlocState {}

class SignedUpSuccessful extends SignUpBlocState {
  final String? message;
  SignedUpSuccessful({this.message});
}

class SignedUpError extends SignUpBlocState {
  final String? errorMessage;

  SignedUpError({this.errorMessage});
}
