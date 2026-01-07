// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pass_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePassResponse _$UpdatePassResponseFromJson(Map<String, dynamic> json) =>
    UpdatePassResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UpdatePassResponseToJson(UpdatePassResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };
