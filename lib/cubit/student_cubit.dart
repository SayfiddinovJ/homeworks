import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/student_state.dart';
import 'package:sqlflite_package/model.dart';
import 'package:sqlflite_package/sqflite.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(InitialState()) {
    get();
  }

  Future<void> add(String name, String lastname, String age) async {
    emit(LoadingState());
    StudentModel studentModel = await LocalDatabase.insertStudent(
        StudentModel(name: name, lastname: lastname, age: age));
    emit(AddSuccessState(studentModel: studentModel));
  }

  Future<void> update(int id, String name, String lastname, String age) async {
    emit(LoadingState());
    await LocalDatabase.updateStudent(
        id: id,
        studentModel: StudentModel(name: name, lastname: lastname, age: age));
    emit(UpdateSuccessState());
  }

  Future<void> get() async {
    emit(LoadingState());
    List<StudentModel> studentModel = await LocalDatabase.getAllStudents();
    emit(GetState(studentModel: studentModel));
  }

  Future<void> delete(int id) async {
    emit(LoadingState());
    await LocalDatabase.deleteStudent(id);
    get();
    emit(DeleteState());
  }
}
