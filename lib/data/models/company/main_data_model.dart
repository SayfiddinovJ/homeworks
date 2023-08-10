import 'package:homeworks/data/models/company/company_model.dart';

class MainDataModel {
  List<CompanyModel> companyModel;

  MainDataModel({required this.companyModel});

  factory MainDataModel.fromJson(Map<String, dynamic> json) => MainDataModel(
        companyModel: List<CompanyModel>.from(
          json["data"].map(
            (e) => CompanyModel.fromJson(e),
          ),
        ),
      );
}
