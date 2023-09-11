import 'package:homeworks/data/model/definitions_model.dart';
import 'package:homeworks/data/model/phonetics_model.dart';

class DictionaryModel {
  final String word;
  final String phonetic;
  final List<PhoneticsModel> phonetics;
  final List<DefinitionModel> meaning;


  DictionaryModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meaning,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      word: json['word'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      phonetics: PhoneticsModel.getFromList(json['phonetics']),
      meaning: DefinitionModel.getFromList(json['meanings'][0]['definitions'])
    );
  }

  static List<DictionaryModel> getFromList(List? list) {
    return list?.map((e) => DictionaryModel.fromJson(e)).toList() ?? [];
  }
}
