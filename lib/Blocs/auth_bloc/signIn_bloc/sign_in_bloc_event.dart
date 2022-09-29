part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignIn extends SignInEvent {
  final String phoneNumber;
  final String password;

  SignIn({
    required this.phoneNumber,
    required this.password,
  });
}

class SignOut extends SignInEvent {}
