import '../entities/top_student.dart';
import '../repositories/top_students_repository.dart';

class GetTopStudents {
  final TopStudentsRepository repository;

  const GetTopStudents(this.repository);

  Future<List<TopStudent>> call() => repository.fetchTopStudents();
}
