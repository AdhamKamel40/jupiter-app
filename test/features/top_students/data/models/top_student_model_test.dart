import 'package:flutter_test/flutter_test.dart';
import 'package:jupiter/features/top_students/data/models/top_student_model.dart';

void main() {
  group('TopStudentModel.fromTopThreeResponse', () {
    test('parses the students array and returns only the first three', () {
      final students = TopStudentModel.fromTopThreeResponse({
        'userRank': 3,
        'students': [
          {
            'id': 'first-id',
            'name': 'FirstStudent',
            'profileImagePath': 'https://example.com/first.jpg',
            'jupiterCoins': 293,
            'branch': 'Bitash',
          },
          {
            'id': 'second-id',
            'name': 'SecondStudent',
            'profileImagePath': null,
            'jupiterCoins': 250,
            'branch': 'Bitash',
          },
          {
            'id': 'third-id',
            'name': 'ThirdStudent',
            'jupiterCoins': 245,
            'branch': 'Bitash',
          },
          {'id': 'fourth-id', 'name': 'FourthStudent', 'jupiterCoins': 212},
        ],
      });

      expect(students, hasLength(3));
      expect(students.map((student) => student.id), [
        'first-id',
        'second-id',
        'third-id',
      ]);
      expect(students.first.jupiterCoins, 293);
      expect(students[1].profileImagePath, isEmpty);
    });
  });
}
