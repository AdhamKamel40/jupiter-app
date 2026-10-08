class StudentBatch {
  final String id;
  final String name;
  final String courseName;
  final String branch;
  final String status;

  const StudentBatch({
    required this.id,
    required this.name,
    required this.courseName,
    required this.branch,
    required this.status,
  });

  factory StudentBatch.fromJson(Map<String, dynamic> json) {
    return StudentBatch(
      id: json['id']?.toString() ?? json['batchId']?.toString() ?? '',
      name: json['name']?.toString() ?? json['batchName']?.toString() ?? '',
      courseName:
          json['courseName']?.toString() ?? json['course']?.toString() ?? '',
      branch: json['branch']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
    );
  }
}
