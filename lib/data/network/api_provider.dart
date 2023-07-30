import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/models/user_model.dart';
import 'package:homeworks/data/network/network_utils.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UniversalData> getData() async {
    Uri uri = Uri.https(
      'jsonplaceholder.typicode.com',
      "/albums",
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => UserModel.fromJson(e))
                  .toList() ??
              [],
        );
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
