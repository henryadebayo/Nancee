import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../Repo/models/users_model.dart';
import '../../../Repo/services/auth_services.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpBlocState> {
  SignUpBloc() : super(SignupBlocInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignUp) {
        try {
          emit(SignUpLoading());
          final authServices = AuthServices();
          final user =
              await authServices.signUp(event.phoneNumber, event.password);
          emit(SignedUpSuccessful(message: user!.message));
        } on SocketException {
          emit(SignedUpError(errorMessage: "Check Internet Connection"));
        } catch (e) {
          String errorMessage = "";
          if (e == null) {
            errorMessage = "Phone Number Already Exist";
          } else {
            errorMessage = e.toString();
          }
          emit(
            SignedUpError(errorMessage: errorMessage),
          );
          print(e.toString());
        }
      }
    });
  }
}
