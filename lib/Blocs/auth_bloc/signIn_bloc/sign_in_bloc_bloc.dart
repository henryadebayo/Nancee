import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInEvent, AuthSignInState> {
  String? msg;
  SignInBloc() : super(SignInInitial()) {
    //initAuthState();
    on<SignInEvent>((event, emit) {
      if (event is SignIn) {
        login(event.email, event.password);
      }
      if (event is SignOut) {
        logOut();
      }
    });
  }

  Future<AuthSignInState> login(String email, String password) async {
    try {
      emit(SignInLoading());
      final authServices = AuthServices();
      final user = await authServices.signIn(email, password);
      print("THIS IS SIGN IN BLOC MESSAGE :::::${user}");
      return (SignedIn(user: user));
      msg = user;
    } catch (e) {
      return (SignInError(errorMsg: e.toString()));
    }
  }

  Future<void> logOut() async {
    final authServices = AuthServices();
    await authServices.signOut();
  }

  Future<AuthSignInState> initAuthState() async {
    emit(SignInLoading());
    final authServices = AuthServices();
    final user = await authServices.getLoggedInUserData();
    if (user == null) {
      return (SignInInitial());
    } else {
      return (SignedIn(user: user));
    }
  }
}
