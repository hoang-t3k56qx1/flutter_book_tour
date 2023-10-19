import 'package:dio/dio.dart';

class DioSingleton {
  static late Dio _dio;

  static Dio get dio {
    _dio ??= Dio();
    return _dio;
  }
}
