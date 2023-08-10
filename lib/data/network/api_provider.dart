import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/data/models/car/car_model.dart';
import 'package:homeworks/data/models/company/main_data_model.dart';
import 'package:homeworks/data/models/country/data_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/utils/constants.dart';

class ApiProvider {
  static final dio = Dio(BaseOptions(baseUrl: baseUrl));

  static Future<UniversalData> getCountries() async {
    try {
      Response response;
      response = await dio.get('/countries');
      debugPrint('-----${response.data}-----');
      if (response.statusCode == 200) {
        debugPrint('-----${response.data}-----');
        return UniversalData(data: MainCountryModel.fromJson(response.data));
      }
      return UniversalData(error: 'ERROR');
    } catch (error) {
      debugPrint('-----$error-----');
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> getCompanies() async {
    try {
      Response response;
      response = await dio.get('/companies');
      debugPrint('-----${response.data}-----');
      if (response.statusCode == 200) {
        debugPrint('-----${response.data}-----');
        return UniversalData(data: MainDataModel.fromJson(response.data));
      }
      return UniversalData(error: 'ERROR');
    } catch (error) {
      debugPrint('-----$error-----');
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> getCar(int id) async {
    try {
      Response response;
      response = await dio.get('/companies/$id');
      debugPrint('-----${response.data}-----');
      if (response.statusCode == 200) {
        debugPrint('-----${response.data}-----');
        return UniversalData(data: CarModel.fromJson(response.data));
      }
      return UniversalData(error: 'ERROR');
    } catch (error) {
      debugPrint('-----$error-----');
      return UniversalData(error: error.toString());
    }
  }
}
