import 'package:dio/dio.dart';

class BaseProvider {
  final Dio _dio;

  BaseProvider(this._dio);

  Future<Response> get(String path) async {
    return _dio.get(path);
  }
}