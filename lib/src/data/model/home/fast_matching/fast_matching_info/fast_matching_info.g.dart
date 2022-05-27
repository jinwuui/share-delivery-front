// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_matching_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FastMatchingInfo _$$_FastMatchingInfoFromJson(Map<String, dynamic> json) =>
    _$_FastMatchingInfo(
      matchingId: json['matchingId'] as int,
      matchingTag: json['matchingTag'] as String,
      participatedDateTime:
          DateTime.parse(json['participatedDateTime'] as String),
    );

Map<String, dynamic> _$$_FastMatchingInfoToJson(_$_FastMatchingInfo instance) =>
    <String, dynamic>{
      'matchingId': instance.matchingId,
      'matchingTag': instance.matchingTag,
      'participatedDateTime': instance.participatedDateTime.toIso8601String(),
    };
