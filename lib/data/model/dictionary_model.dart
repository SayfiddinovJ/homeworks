import 'package:homeworks/data/model/phonetics_model.dart';

class DictionaryModel {
  final String word;
  final String phonetic;
  final List<PhoneticsModel> phonetics;

  DictionaryModel({
    required this.word,
    required this.phonetic,
    required this.phonetics,
  });

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      word: json['word'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      phonetics: PhoneticsModel.getFromList(json['phonetics']),
    );
  }

  static List<DictionaryModel> getFromList(List? list) {
    return list?.map((e) => DictionaryModel.fromJson(e)).toList() ?? [];
  }
}
