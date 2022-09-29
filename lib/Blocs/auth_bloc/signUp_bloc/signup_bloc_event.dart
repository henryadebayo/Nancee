part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignUp extends SignupEvent {
  final String phoneNumber;
  final String password;

  SignUp({
    required this.phoneNumber,
    required this.password,
  });
}
