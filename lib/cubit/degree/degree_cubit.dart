import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/degree/degree_state.dart';

class DegreeCubit extends Cubit<DegreeState> {
  DegreeCubit() : super(DegreeState());

  updateA(int a){
    emit(state.copyWith(a: a));
  }
  updateB(int b){
    emit(state.copyWith(b: b));
  }
}
