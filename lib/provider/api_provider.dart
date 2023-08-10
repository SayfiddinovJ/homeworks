import 'dart:convert';
import 'package:homeworks/data/models/main_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/network_utils.dart';
import 'package:http/http.dart' as http;


class ApiProvider {
  static Future<UniversalData> getProducts() async   {
    Uri uri = Uri.parse("https://dynamic-view-api.free.mockoapp.net/views");

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
          data: MainModel.fromJson((jsonDecode(response.body))),
        );
      }
      handleHttpErrors(response);
    } catch (error) {
      UniversalData(error: "mavjud error");
    }
    return UniversalData(error: "return mavjud error");
  }
}