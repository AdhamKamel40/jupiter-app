import 'package:flutter/foundation.dart';

import '../../domain/entities/top_student.dart';
import '../../domain/use_cases/get_top_students.dart';

class TopStudentsViewModel extends ChangeNotifier {
  final GetTopStudents getTopStudents;

  TopStudentsViewModel(this.getTopStudents);

  List<TopStudent> students = const [];
  bool isLoading = false;
  String? errorMessage;
  bool _isDisposed = false;

  Future<void> load() async {
    isLoading = true;
    errorMessage = null;
    _notifyListeners();

    try {
      students = await getTopStudents();
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      _notifyListeners();
    }
  }

  void _notifyListeners() {
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
