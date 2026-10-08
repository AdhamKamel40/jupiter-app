import 'package:dio/dio.dart';

class DioFactory {
  static const String baseUrl = 'https://api2.jupitersoftware.net/api/';
  static Dio? _dio;

  static Dio getDio() {
    if (_dio != null) return _dio!;

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio = Dio(options)
      ..interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
        ),
      );

    return _dio!;
  }
}
