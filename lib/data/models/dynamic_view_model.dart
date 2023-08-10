class DynamicViewModel {
  final String title;
  final int sort;
  final String group;
  final num width;
  final num height;
  final String color;
  final String type;

  DynamicViewModel({
    required this.sort,
    required this.type,
    required this.title,
    required this.color,
    required this.width,
    required this.height,
    required this.group,
  });

  factory DynamicViewModel.fromJson(Map<String, dynamic> json) {
    print('object2');
    return DynamicViewModel(
      sort: json["sort"] as int? ?? 0,
      type: json["type"] as String? ?? "",
      title: json["title"] as String? ?? "",
      color: json["color"] as String? ?? "",
      width: json["width"] as num? ?? 0,
      group: json["group"] as String? ?? "",
      height: json["height"] as num? ?? 0,
    );
  }
}
