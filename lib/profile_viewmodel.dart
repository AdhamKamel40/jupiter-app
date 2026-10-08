import 'package:flutter/material.dart';

import 'model/attendance_record.dart';
import 'model/student_batch.dart';
import 'model/student_profile.dart';

class ProfileViewModel extends ChangeNotifier {
  static const String studentId = 'student-id';

  int selectedTab = 0;
  DateTime selectedMonth = DateTime(2026, 9);

  bool isLoadingProfile = false;
  bool isLoadingEnrollments = false;
  bool isLoadingAttendance = false;

  String? profileError;
  String? enrollmentsError;
  String? attendanceError;

  StudentProfile? profile;
  List<StudentBatch> enrollments = [];
  List<AttendanceRecord> attendance = [];

  final List<String> tabs = [
    'Overview',
    'Attendance',
    'Operations',
    'Tasks',
    'Info',
  ];

  String get monthName {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[selectedMonth.month - 1];
  }

  void changeMonth(int amount) {
    selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + amount);
    notifyListeners();
  }

  void resetMonth() {
    selectedMonth = DateTime(2026, 9);
    notifyListeners();
  }

  void selectTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  Future<void> loadAll() async {
    await Future.wait([fetchProfile(), fetchEnrollments(), fetchAttendance()]);
  }

  Future<void> fetchProfile() async {
    isLoadingProfile = true;
    profileError = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      profile = StudentProfile.empty();
    } catch (e) {
      profileError = e.toString();
    } finally {
      isLoadingProfile = false;
      notifyListeners();
    }
  }

  Future<void> fetchEnrollments() async {
    isLoadingEnrollments = true;
    enrollmentsError = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      enrollments = [];
    } catch (e) {
      enrollmentsError = e.toString();
    } finally {
      isLoadingEnrollments = false;
      notifyListeners();
    }
  }

  Future<void> fetchAttendance() async {
    isLoadingAttendance = true;
    attendanceError = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      attendance = [];
    } catch (e) {
      attendanceError = e.toString();
    } finally {
      isLoadingAttendance = false;
      notifyListeners();
    }
  }

  void retry() {
    loadAll();
  }

  IconData tabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.bar_chart_rounded;
      case 1:
        return Icons.check_circle_outline_rounded;
      case 2:
        return Icons.business_center_outlined;
      case 3:
        return Icons.task_alt_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }
}
