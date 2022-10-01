import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Repo/services/auth_services.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is SignIn) {
        try {
          emit(SignInLoading());
          final authServices = AuthServices();
          final user =
              await authServices.signIn(event.phoneNumber, event.password);
          print("THIS IS SIGN IN BLOC MESSAGE :::::${user}");
          emit(SignInSuccessful(user: user));
        } on SocketException {
          emit(SignInError(errorMsg: "Check Internet Connection"));
        } catch (e) {
          emit(SignInError(errorMsg: e.toString()));
        }
      }
      if (event is SignOut) {
        final authServices = AuthServices();
        await authServices.signOut();
      }
    });
  }
  //
}
