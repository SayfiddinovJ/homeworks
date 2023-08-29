import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/models/user_model.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://fifth-exam.free.mockoapp.net',
      headers: {"Content-Type": "application/json"},
    ),
  );

  ApiService() {
    init();
  }

  init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint('On Error: ${error.message}');
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint('On Request: ${requestOptions.data}');
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint('On Response: ${response.data}');
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getUsers() async {
    Response response;
    try {
      response = await _dio.get("/users");
      if (response.statusCode == 200) {
        return UniversalData(
          data: (response.data as List?)
              ?.map((e) => UserModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.toString());
      } else {
        return UniversalData(error: e.toString());
      }
    } catch (e) {
      debugPrint("CAUGHT: $e");
      return UniversalData(error: e.toString());
    }
  }
}