import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  updateUsername(String username){
    emit(state.copyWith(username: username));
  }
  updateEmail(String email){
    emit(state.copyWith(email: email));
  }

  updatePassword(String password){
    emit(state.copyWith(password: password));
  }
}
