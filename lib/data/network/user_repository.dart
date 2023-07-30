import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<UniversalData> getData() => apiProvider.getData();
}
