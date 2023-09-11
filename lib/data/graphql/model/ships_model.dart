class ShipsModel {
  final String id;
  final String name;
  final String model;
  final String image;
  final String status;
  final List roles;
  final int yearBuilt;
  final String type;

  ShipsModel({
    required this.id,
    required this.name,
    required this.model,
    required this.image,
    required this.status,
    required this.roles,
    required this.yearBuilt,
    required this.type,
  });

  factory ShipsModel.fromJson(Map<String, dynamic> json) {
    return ShipsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '?',
      model: json['model'] ?? '?',
      image: json['image'] ?? '?',
      status: json['status'] ?? '?',
      roles: json['roles'] ?? [],
      yearBuilt: json['year_built'] as int? ?? 0,
      type: json['type'] ?? '?',
    );
  }
}
