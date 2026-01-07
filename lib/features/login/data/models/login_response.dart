import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final UserData? data;
  final String? token;

  LoginResponse({this.data, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String? id;

  final String? name;
  final String? email;
  final String? role;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(name: 'profileImage')
  final String? profileImage;

  final bool? createReport;

  @JsonKey(name: 'Date_of_Birth')
  final DateTime? dateOfBirth;

  final String? department;
  final String? level;

  UserData({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phoneNumber,
    this.profileImage,
    this.createReport,
    this.dateOfBirth,
    this.department,
    this.level,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
