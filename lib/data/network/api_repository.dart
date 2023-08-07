
import '../../models/card/card_model.dart';
import '../../models/universal_response.dart';
import 'api_provider.dart';

class BankRepository {
  final ApiProvider apiProvider;

  BankRepository({required this.apiProvider});

  Future<List<BankModel>> fetchCardsForHome() async {
    UniversalResponse universalResponse = await apiProvider.getAllCards();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<BankModel>;
    }
    return [];
  }

}

