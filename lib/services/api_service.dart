import 'package:dio/dio.dart';

import '../model/attendance_record.dart';
import '../model/student_batch.dart';
import '../model/student_profile.dart';
import 'dio_factory.dart';

class ApiService {
  static final Dio _dio = DioFactory.getDio();

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        'UserV2/login',
        data: {'email': email, 'password': password},
      );
      return _decodeResponse(response.data);
    } on DioException catch (error) {
      throw ApiException(
        _getErrorMessage(error, 'Login failed. Please check your credentials.'),
      );
    }
  }

  static Future<Map<String, dynamic>> getUser(String token) async {
    try {
      final response = await _dio.get(
        'userV2',
        options: _getAuthOptions(token),
      );
      return _decodeResponse(response.data);
    } on DioException catch (error) {
      throw ApiException(
        _getErrorMessage(error, 'Unable to get user information.'),
      );
    }
  }

  static Future<void> logout(String token) async {
    try {
      await _dio.post('/api/logout', options: _getAuthOptions(token));
    } on DioException catch (error) {
      throw ApiException(_getErrorMessage(error, 'Logout failed.'));
    }
  }

  static Future<StudentProfile> getStudentProfile(String studentId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return StudentProfile.empty();
  }

  static Future<List<StudentBatch>> getStudentBatches(String studentId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [];
  }

  static Future<List<AttendanceRecord>> getAttendance(String studentId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [];
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
    } on DioException catch (error) {
      throw ApiException(_getErrorMessage(error, 'Request failed.'));
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
    } on DioException catch (error) {
      throw ApiException(_getErrorMessage(error, 'Request failed.'));
    }
  }

  static List<Map<String, dynamic>> _extractItems(
    dynamic data,
    List<String> keys,
  ) {
    dynamic listData = data;

    if (data is Map) {
      for (final key in keys) {
        if (data[key] != null) {
          listData = data[key];
          break;
        }
      }
    }

    if (listData is Map) {
      for (final value in listData.values) {
        if (value is List) {
          listData = value;
          break;
        }
      }
    }

    if (listData is! List) return const [];

    return listData
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .toList();
  }

  static Options? _getAuthOptions(String? token) {
    if (token == null || token.isEmpty) return null;

    return Options(headers: {'Authorization': 'Bearer $token'});
  }

  static Map<String, dynamic> _decodeResponse(dynamic data) {
    if (data == null) return {};
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    return {'data': data};
  }

  static String _getErrorMessage(DioException error, String defaultMessage) {
    final responseData = error.response?.data;

    if (responseData is Map) {
      final message = responseData['message'];
      if (message != null && message.toString().isNotEmpty) {
        return message.toString();
      }

      final errorMessage = responseData['error'];
      if (errorMessage != null && errorMessage.toString().isNotEmpty) {
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

class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => message;
}
