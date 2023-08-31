import 'package:equatable/equatable.dart';
import 'package:homeworks/data/model/status.dart';
import 'package:homeworks/data/model/user_model.dart';

class UserState extends Equatable {
  const UserState({
    required this.status,
    required this.users,
    required this.statusText,
  });

  final FormStatus status;
  final List<UserModel> users;
  final String statusText;

  UserState copyWith({
    FormStatus? status,
    List<UserModel>? users,
    String? statusText,
  }) =>
      UserState(
        status: status ?? this.status,
        users: users ?? this.users,
        statusText: statusText ?? this.statusText,
      );

  @override
  List<Object?> get props => [status, users, statusText];
}
