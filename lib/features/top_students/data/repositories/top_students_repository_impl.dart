import '../../domain/entities/top_student.dart';
import '../../domain/repositories/top_students_repository.dart';
import '../data_sources/top_students_remote_data_source.dart';
import '../models/top_student_model.dart';

class TopStudentsRepositoryImpl implements TopStudentsRepository {
  final TopStudentsRemoteDataSource remoteDataSource;

  const TopStudentsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<TopStudent>> fetchTopStudents() async {
    final response = await remoteDataSource.fetchTopThree();
    return TopStudentModel.fromTopThreeResponse(
      response,
    ).map((model) => model.toEntity()).toList();
  }
}
