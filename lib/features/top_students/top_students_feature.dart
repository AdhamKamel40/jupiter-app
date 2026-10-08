import 'data/data_sources/top_students_remote_data_source.dart';
import 'data/repositories/top_students_repository_impl.dart';
import 'domain/use_cases/get_top_students.dart';
import 'presentation/view_models/top_students_view_model.dart';

class TopStudentsFeature {
  const TopStudentsFeature._();

  static TopStudentsViewModel createViewModel() {
    final remoteDataSource = TopStudentsRemoteDataSource();
    final repository = TopStudentsRepositoryImpl(remoteDataSource);
    final useCase = GetTopStudents(repository);
    return TopStudentsViewModel(useCase);
  }
}
