import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/service/api_service.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository({required this.apiService});

  Future<UniversalData> getUsers() async => await apiService.getUsers();
}
