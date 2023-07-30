import 'package:flutter/foundation.dart';
import 'package:homeworks/data/form_status.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/models/user_model.dart';
import 'package:homeworks/data/network/user_repository.dart';

class UserProvider with ChangeNotifier {
  UserProvider({required this.userRepository}) {
    //  fetchWeatherInfoByQuery();
  }

  final UserRepository userRepository;

  String query = "Tashkent";
  String errorText = "";

  FormStatus status = FormStatus.pure;

  List<UserModel>? userModel;

  fetchUserData() async {
    notify(FormStatus.loading);
    UniversalData universalData =
    await userRepository.getData();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      userModel = universalData.data as List<UserModel>;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}
