import 'package:equatable/equatable.dart';
import 'package:homeworks/data/model/user_model.dart';

abstract class UserEvent extends Equatable {}

class AddUser extends UserEvent {
  AddUser({required this.newUser});

  final UserModel newUser;

  @override
  List<Object?> get props => [newUser];
}

class GetUser extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUser extends UserEvent {
  UpdateUser({required this.id, required this.userModel});

  final int id;
  final UserModel userModel;

  @override
  List<Object?> get props => [userModel];
}

class DeleteUser extends UserEvent {
  DeleteUser({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
