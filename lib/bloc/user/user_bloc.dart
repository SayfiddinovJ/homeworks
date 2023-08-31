import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/bloc/user/user_event.dart';
import 'package:homeworks/bloc/user/user_state.dart';
import 'package:homeworks/data/local/sqflite.dart';
import 'package:homeworks/data/model/status.dart';
import 'package:homeworks/data/model/universal_data.dart';
import 'package:homeworks/data/model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(
          const UserState(
            status: FormStatus.pure,
            users: [],
            statusText: '',
          ),
        ) {
    on<AddUser>(_addUser);
    on<GetUser>(_getUser);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  _addUser(AddUser event, Emitter<UserState> emit) async {
    debugPrint('add user bloc');
    emit(state.copyWith(
        status: FormStatus.loading, statusText: 'Adding new user...'));
    UserModel userModel = await LocalDatabase.insertUser(event.newUser);
    emit(
      state.copyWith(
        statusText: 'User added',
        status: FormStatus.done,
        users: [
          ...state.users,
          event.newUser,
        ],
      ),
    );
  }

  _getUser(GetUser event, Emitter<UserState> emit) async {
    debugPrint('getting user bloc');
    emit(state.copyWith(
        status: FormStatus.loading, statusText: 'Getting users...'));
    List<UserModel> userModel = await LocalDatabase.getAllUsers();
    if (userModel.isEmpty) {
      emit(
        state.copyWith(
          statusText: 'Users is empty',
          status: FormStatus.success,
          users: [...state.users, ...userModel],
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusText: 'Users arrived',
          status: FormStatus.success,
          users: [...userModel],
        ),
      );
    }
  }

  _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: 'Updating user...'));
    UniversalData data = await LocalDatabase.updateUser(
        id: event.id, userModel: event.userModel);
    List<UserModel> userModel = await LocalDatabase.getAllUsers();

    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusText: 'User updated',
          status: FormStatus.done,
          users: userModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusText: 'User deleting error: ${data.error}',
          status: FormStatus.error,
        ),
      );
    }
  }

  _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(
        statusText: 'User deleting...',
        status: FormStatus.loading,
      ),
    );
    UniversalData data = await LocalDatabase.deleteUser(event.id);
    List<UserModel> userModel = await LocalDatabase.getAllUsers();
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          statusText: 'User deleted',
          status: FormStatus.success,
          users: userModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          statusText: 'User deleting error: ${data.error}',
          status: FormStatus.error,
        ),
      );
    }
  }
}
