// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_sms_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthSmsResDTO _$$_AuthSmsResDTOFromJson(Map<String, dynamic> json) =>
    _$_AuthSmsResDTO(
      requestId: json['requestId'] as String,
      statusCode: json['statusCode'] as String,
      statusName: json['statusName'] as String,
      requestTime: DateTime.parse(json['requestTime'] as String),
      phoneNumber: json['phoneNumber'] as String,
      verificationType: json['verificationType'] as String,
    );

Map<String, dynamic> _$$_AuthSmsResDTOToJson(_$_AuthSmsResDTO instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'statusCode': instance.statusCode,
      'statusName': instance.statusName,
      'requestTime': instance.requestTime.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'verificationType': instance.verificationType,
    };
