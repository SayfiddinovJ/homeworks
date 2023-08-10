class CarModel {
  int id;
  String carModel;
  String logo;
  int establishedYear;
  int averagePrice;
  String description;
  List<dynamic> carPics;

  CarModel({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.establishedYear,
    required this.averagePrice,
    required this.description,
    required this.carPics,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] as int? ?? 0,
      carModel: json['car_model'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      establishedYear: json['established_year'] as int? ?? 0,
      averagePrice: json['average_price'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      carPics: json['car_pics'] as List<dynamic>? ?? [],
    );
  }
}
