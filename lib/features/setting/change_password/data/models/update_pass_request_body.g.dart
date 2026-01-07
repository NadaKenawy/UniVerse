// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pass_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePassRequestBody _$UpdatePassRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdatePassRequestBody(
  oldPassword: json['oldPassword'] as String,
  newPassword: json['newPassword'] as String,
  passwordConfirm: json['passwordConfirm'] as String,
);

Map<String, dynamic> _$UpdatePassRequestBodyToJson(
  UpdatePassRequestBody instance,
) => <String, dynamic>{
  'oldPassword': instance.oldPassword,
  'newPassword': instance.newPassword,
  'passwordConfirm': instance.passwordConfirm,
};
