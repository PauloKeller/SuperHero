import 'package:dio/dio.dart';

class BaseProvider {
  late Dio _dio;
  final String _baseUrl;

  BaseProvider(this._baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Future<Response> get(String path) async {
    final url = _baseUrl + path;
    return _dio.get(url);
  }
}