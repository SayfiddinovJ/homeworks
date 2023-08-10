import 'package:homeworks/data/models/country/country_model.dart';

class MainCountryModel {
  DataModel dataModel;

  MainCountryModel({required this.dataModel});

  factory MainCountryModel.fromJson(Map<String, dynamic> json) =>
      MainCountryModel(dataModel: DataModel.fromJson(json['data']));
}

class DataModel {
  List<CountryModel> countryModel;

  DataModel({required this.countryModel});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        countryModel: List<CountryModel>.from(
          json["countries"].map(
            (e) => CountryModel.fromJson(e),
          ),
        ),
      );
}
