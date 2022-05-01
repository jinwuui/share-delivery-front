// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiving_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceivingLocation _$$_ReceivingLocationFromJson(Map<String, dynamic> json) =>
    _$_ReceivingLocation(
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ReceivingLocationToJson(
        _$_ReceivingLocation instance) =>
    <String, dynamic>{
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
