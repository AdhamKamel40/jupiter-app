import '../entities/top_student.dart';

abstract interface class TopStudentsRepository {
  Future<List<TopStudent>> fetchTopStudents();
}
