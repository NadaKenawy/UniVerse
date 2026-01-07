class UserModel {
  final String id;
  final String name;
  final String email;
  final String? role;
  final String? phoneNumber;
  final String? profileImage;
  final bool createReport;
  final String? token;
  final DateTime? dateOfBirth;
  final String? department;
  final String? level;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    this.phoneNumber,
    this.profileImage,
    required this.createReport,
    this.token,
    this.dateOfBirth,
    this.department,
    this.level,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;

    return UserModel(
      id: data['_id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'],
      phoneNumber: data['phone_number'],
      profileImage: data['profileImage'],
      createReport: data['createReport'] ?? false,
      token: json['token'] ?? data['token'],
      dateOfBirth: data['Date_of_Birth'] != null
          ? DateTime.tryParse(data['Date_of_Birth'])
          : null,
      department: data['department'],
      level: data['level'],
    );
  }

  /// Converts UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': {
        '_id': id,
        'name': name,
        'email': email,
        'role': role,
        'phone_number': phoneNumber,
        'profileImage': profileImage,
        'createReport': createReport,
        'Date_of_Birth': dateOfBirth?.toIso8601String(),
        'department': department,
        'level': level,
      },
      'token': token,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? phoneNumber,
    String? profileImage,
    bool? createReport,
    String? token,
    DateTime? dateOfBirth,
    String? department,
    String? level,
    
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      createReport: createReport ?? this.createReport,
      token: token ?? this.token,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      department: department ?? this.department,
      level: level ?? this.level,
    );
  }
}
