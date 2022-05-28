// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      postId: json['postId'] as int? ?? -1,
      coordinate:
          PostLocation.fromJson(json['coordinate'] as Map<String, dynamic>),
      content: json['content'] as String,
      postCategory: json['postCategory'] as String,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'coordinate': instance.coordinate,
      'content': instance.content,
      'postCategory': instance.postCategory,
    };

_$_PostLocation _$$_PostLocationFromJson(Map<String, dynamic> json) =>
    _$_PostLocation(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PostLocationToJson(_$_PostLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
