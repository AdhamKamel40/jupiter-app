import '../../domain/entities/top_student.dart';

class TopStudentModel {
  final String id;
  final String name;
  final String profileImagePath;
  final int jupiterCoins;
  final String? branch;

  const TopStudentModel({
    required this.id,
    required this.name,
    required this.profileImagePath,
    required this.jupiterCoins,
    required this.branch,
  });

  factory TopStudentModel.fromJson(Map<String, dynamic> json) {
    return TopStudentModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      profileImagePath: json['profileImagePath']?.toString() ?? '',
      jupiterCoins: _toInt(json['jupiterCoins']),
      branch: json['branch']?.toString(),
    );
  }

  TopStudent toEntity() {
    return TopStudent(
      id: id,
      name: name,
      profileImagePath: profileImagePath,
      jupiterCoins: jupiterCoins,
      branch: branch,
    );
  }

  static List<TopStudentModel> fromTopThreeResponse(Map<String, dynamic> json) {
    final dynamic payload = json['data'] ?? json['result'] ?? json;
    if (payload is! Map) return const [];

    final dynamic students = payload['students'];
    if (students is List) {
      return students
          .whereType<Map>()
          .take(3)
          .map(
            (student) =>
                TopStudentModel.fromJson(Map<String, dynamic>.from(student)),
          )
          .where((student) => student.name.isNotEmpty)
          .toList();
    }

    return ['first', 'second', 'third']
        .map((place) => payload[place])
        .whereType<Map>()
        .map(
          (student) =>
              TopStudentModel.fromJson(Map<String, dynamic>.from(student)),
        )
        .where((student) => student.name.isNotEmpty)
        .toList();
  }
}

int _toInt(dynamic value) {
  if (value is int) return value;
  if (value is double) return value.round();
  return int.tryParse(value?.toString() ?? '') ?? 0;
}
