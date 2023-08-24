
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/api_state.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/models/user_model.dart';
import 'package:homeworks/data/repository/api_repository.dart';

class ApiCubit extends Cubit<ApiState>{
  ApiCubit({required this.apiRepository}) : super(ApiInitial()){
    getUser();
  }

  final ApiRepository apiRepository;

  List<UserModel> userModel = [];

  Future<void> getUser() async {
    emit(ApiLoadingState());
    UniversalData universalData = await apiRepository.getUsers();
    if (universalData.error.isEmpty) {
      userModel = universalData.data as List<UserModel>;
      emit(ApiSuccessState());
    } else {
      emit(ApiErrorState(error: universalData.error));
    }
  }
}

