part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignupBlocState {}

class SignupBlocInitial extends SignupBlocState {}

class SignUpLoading extends SignupBlocState {}

class SignedUpSuccessful extends SignupBlocState {
  final String? message;
  SignedUpSuccessful({this.message});
}

class SignedUpError extends SignupBlocState {
  final String? errorMessage;

  SignedUpError({this.errorMessage});
}
