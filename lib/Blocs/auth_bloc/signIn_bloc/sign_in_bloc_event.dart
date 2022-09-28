part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn({
    required this.email,
    required this.password,
  });
}

class SignOut extends SignInEvent {}
