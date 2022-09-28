import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupBlocState> {
  SignupBloc() : super(SignupBlocInitial()) {
    on<SignupEvent>((event, emit) {
      if (event is SignUp) {
        Register(event.email, event.password, event.firstName, event.lastName);
      }
    });
  }
  Future<SignupBlocState> Register(
      String email, String password, String firstName, String lastName) async {
    try {
      emit(SignUpLoading());
      final authServices = AuthServices();
      final message =
          await authServices.signUp(email, password, firstName, lastName);
      print("THIS IS SIGN UP BLOC MESSAGE :::::${message.toString()}");
      return (SignedUpSuccessful(message: message));
    } catch (e) {
      return (SignedUpError(errorMessage: e.toString()));
    }
  }
}
