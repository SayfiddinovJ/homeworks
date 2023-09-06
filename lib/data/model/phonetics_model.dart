class PhoneticsModel {
  final String text;
  final String audio;

  PhoneticsModel({
    required this.text,
    required this.audio,
  });

  factory PhoneticsModel.fromJson(Map<String, dynamic> json) {
    return PhoneticsModel(
      text: json['text'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
    );
  }

  static List<PhoneticsModel> getFromList(List? list) {
    return list?.map((e) => PhoneticsModel.fromJson(e)).toList() ?? [];
  }
}
