import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/login/login_state.dart';
import 'package:homeworks/firebase_service/auth_service.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  Future<void> signIn(String email, String password,BuildContext context) async {
    emit(SignInState(login: email, password: password));
    await AuthService.login(context);
    emit(LoggedState());
  }

  Future<void> signUp(String email, String password, String username,BuildContext context) async {
    emit(
      SignUpState(
        email: email,
        password: password,
        username: username,
      ),
    );
    await AuthService.createUser(context, email, password);
    emit(LoggedState());
  }

  logOutUser() {
    emit(UnAuthenticatedState());
  }
}