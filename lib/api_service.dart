import 'package:dio/dio.dart';
import 'dio_factory.dart';

class ApiService {
  static final Dio _dio = DioFactory.getDio();


  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return _decodeResponse(response.data);
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(
          e,
          'Login failed. Please check your credentials.',
        ),
      );
    }
  }


  static Future<Map<String, dynamic>> getUser(
    String token,
  ) async {
    try {
      final response = await _dio.get(
        '/api/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return _decodeResponse(response.data);
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(
          e,
          'Unable to get user information.',
        ),
      );
    }
  }


  static Future<void> logout(
    String token,
  ) async {
    try {
      await _dio.post(
        '/api/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(
          e,
          'Logout failed.',
        ),
      );
    }
  }


  static Future<Map<String, dynamic>> get(
    String endpoint, {
    String? token,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: _getAuthOptions(token),
      );

      return _decodeResponse(response.data);
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(
          e,
          'Request failed.',
        ),
      );
    }
  }

  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body, {
    String? token,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: body,
        options: _getAuthOptions(token),
      );

      return _decodeResponse(response.data);
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(
          e,
          'Request failed.',
        ),
      );
    }
  }

  // =========================
  // AUTH OPTIONS
  // =========================

  static Options? _getAuthOptions(
    String? token,
  ) {
    if (token == null || token.isEmpty) {
      return null;
    }

    return Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  // =========================
  // DECODE RESPONSE
  // =========================

  static Map<String, dynamic> _decodeResponse(
    dynamic data,
  ) {
    if (data == null) {
      return {};
    }

    if (data is Map<String, dynamic>) {
      return data;
    }

    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }

    return {
      'data': data,
    };
  }

  // =========================
  // ERROR HANDLING
  // =========================

  static String _getErrorMessage(
    DioException error,
    String defaultMessage,
  ) {
    final responseData = error.response?.data;

    if (responseData is Map) {
      final message = responseData['message'];

      if (message != null && message.toString().isNotEmpty) {
        return message.toString();
      }

      final errorMessage = responseData['error'];

      if (errorMessage != null &&
          errorMessage.toString().isNotEmpty) {
        return errorMessage.toString();
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';

      case DioExceptionType.connectionError:
        return 'Unable to connect to the server.';

      case DioExceptionType.badResponse:
        return 'Server returned an error.';

      case DioExceptionType.cancel:
        return 'Request was cancelled.';

      default:
        return defaultMessage;
    }
  }
}

