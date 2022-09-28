part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignUp extends SignupEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignUp({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}
