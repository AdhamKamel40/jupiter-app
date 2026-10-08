import '../../../../services/api_service.dart';

class TopStudentsRemoteDataSource {
  static const String _studentId = 'e2471342-2e72-480b-ae59-9175578aa5c9';

  Future<Map<String, dynamic>> fetchTopThree() {
    return ApiService.get('StudentV2/students-coins/$_studentId');
  }
}
