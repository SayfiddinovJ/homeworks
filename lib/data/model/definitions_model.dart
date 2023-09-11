class DefinitionModel {
  final String definition;
  final String example;

  DefinitionModel({
    required this.definition,
    required this.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'] as String? ?? '',
      example: json['example'] as String? ?? '',
    );
  }

  static List<DefinitionModel> getFromList(List? list) {
    return list?.map((e) => DefinitionModel.fromJson(e)).toList() ?? [];
  }
}
