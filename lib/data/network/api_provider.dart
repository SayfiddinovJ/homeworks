import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:homeworks/data/models/google_search_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/network_utils.dart';
import 'package:homeworks/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<UniversalData> searchFromGoogle({
    required String query,
    required int page,
    required int count,
    required String gl,
  }) async {
    Uri uri = Uri.https(
      baseUrl,
      "/search",
      {
        "q": query,
        "page": page.toString(),
        "num": count.toString(),
        "gl": gl
      },
    );

    try {
      http.Response response = await http.post(uri, headers: {
        "Content-Type": "application/json",
        "X-API-KEY": "68a18cafb048059571d5286c2905420498357f74",
      });

      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: GoogleSearchModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }
}
