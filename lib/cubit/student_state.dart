import 'package:sqlflite_package/model.dart';

class StudentState {}

class InitialState extends StudentState {}

class LoadingState extends StudentState {}

class GetState extends StudentState {
  List<StudentModel> studentModel = [];

  GetState({required this.studentModel});
}

class DeleteState extends StudentState {}

class UpdateSuccessState extends StudentState {}

class AddSuccessState extends StudentState {
  StudentModel studentModel;

  AddSuccessState({required this.studentModel});
}

class ErrorState extends StudentState {}
