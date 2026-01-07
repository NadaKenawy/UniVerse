// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{'data': instance.data, 'token': instance.token};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  phoneNumber: json['phone_number'] as String?,
  profileImage: json['profileImage'] as String?,
  createReport: json['createReport'] as bool?,
  dateOfBirth: json['Date_of_Birth'] == null
      ? null
      : DateTime.parse(json['Date_of_Birth'] as String),
  department: json['department'] as String?,
  level: json['level'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
  'phone_number': instance.phoneNumber,
  'profileImage': instance.profileImage,
  'createReport': instance.createReport,
  'Date_of_Birth': instance.dateOfBirth?.toIso8601String(),
  'department': instance.department,
  'level': instance.level,
};
