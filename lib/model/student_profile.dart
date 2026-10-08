class StudentProfile {
  final String id;
  final String name;
  final String role;
  final bool isActive;
  final String userName;
  final String address;
  final String email;
  final String? whatsApp;
  final String? phoneNumber;
  final int jupiterCoins;
  final String getStartedAt;
  final String dateOfBirth;
  final String profileImagePath;
  final String? paymentInfo;
  final String? lastYearGifted;
  final String? prizeId;
  final String? instapayLink;
  final String? cashWallet;
  final String? cardHolderName;
  final double basicSalary;
  final String status;
  final String branch;
  final int studentCount;
  final int batchCount;
  final int courseCount;

  const StudentProfile({
    required this.id,
    required this.name,
    required this.role,
    required this.isActive,
    required this.userName,
    required this.address,
    required this.email,
    required this.whatsApp,
    required this.phoneNumber,
    required this.jupiterCoins,
    required this.getStartedAt,
    required this.dateOfBirth,
    required this.profileImagePath,
    required this.paymentInfo,
    required this.lastYearGifted,
    required this.prizeId,
    required this.instapayLink,
    required this.cashWallet,
    required this.cardHolderName,
    required this.basicSalary,
    required this.status,
    required this.branch,
    required this.studentCount,
    required this.batchCount,
    required this.courseCount,
  });

  factory StudentProfile.empty() {
    return const StudentProfile(
      id: '',
      name: '',
      role: '',
      isActive: false,
      userName: '',
      address: '',
      email: '',
      whatsApp: null,
      phoneNumber: null,
      jupiterCoins: 0,
      getStartedAt: '',
      dateOfBirth: '',
      profileImagePath: '',
      paymentInfo: null,
      lastYearGifted: null,
      prizeId: null,
      instapayLink: null,
      cashWallet: null,
      cardHolderName: null,
      basicSalary: 0,
      status: '',
      branch: '',
      studentCount: 0,
      batchCount: 0,
      courseCount: 0,
    );
  }

  factory StudentProfile.fromJson(Map<String, dynamic> json) {
    return StudentProfile(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      isActive: json['isActive'] == true,
      userName: json['userName']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      whatsApp: json['whatsApp']?.toString(),
      phoneNumber: json['phoneNumber']?.toString(),
      jupiterCoins: _toInt(json['jupiterCoins']),
      getStartedAt: json['getStartedAt']?.toString() ?? '',
      dateOfBirth: json['dateOfBirth']?.toString() ?? '',
      profileImagePath: json['profileImagePath']?.toString() ?? '',
      paymentInfo: json['paymentInfo']?.toString(),
      lastYearGifted: json['lastYearGifted']?.toString(),
      prizeId: json['prizeId']?.toString(),
      instapayLink: json['instapayLink']?.toString(),
      cashWallet: json['cashWallet']?.toString(),
      cardHolderName: json['cardHolderName']?.toString(),
      basicSalary: _toDouble(json['basicSalary']),
      status: json['status']?.toString() ?? '',
      branch: json['branch']?.toString() ?? '',
      studentCount: _toInt(json['studentCount']),
      batchCount: _toInt(json['batchCount']),
      courseCount: _toInt(json['courseCount']),
    );
  }
}

int _toInt(dynamic value) {
  if (value is int) return value;
  if (value is double) return value.round();
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

double _toDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value?.toString() ?? '') ?? 0;
}
