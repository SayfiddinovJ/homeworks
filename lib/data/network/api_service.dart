import 'package:dio/dio.dart';
import 'package:homeworks/data/model/dictionary_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<DictionaryModel>> getWord(String w) async {
    Response response =
        await dio.get('https://api.dictionaryapi.dev/api/v2/entries/en/$w');

    try {
      if (response.statusCode == 200) {
        return DictionaryModel.getFromList(response.data as List?);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
