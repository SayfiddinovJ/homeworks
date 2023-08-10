class CompanyModel {
  int id;
  String carModel;
  int averagePrice;
  String logo;
  int establishedYear;

  CompanyModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] as int? ?? 0,
      carModel: json['car_model'] as String? ?? '',
      averagePrice: json['average_price'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      establishedYear: json['established_year'] as int? ?? 0,
    );
  }
}
