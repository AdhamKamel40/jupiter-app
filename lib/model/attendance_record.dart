class AttendanceRecord {
  final String id;
  final String date;
  final String status;
  final String note;

  const AttendanceRecord({
    required this.id,
    required this.date,
    required this.status,
    required this.note,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      id: json['id']?.toString() ?? '',
      date:
          json['date']?.toString() ?? json['attendanceDate']?.toString() ?? '',
      status:
          json['status']?.toString() ??
          json['attendanceStatus']?.toString() ??
          '',
      note: json['note']?.toString() ?? json['notes']?.toString() ?? '',
    );
  }
}
