// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserWithOrderModel _$$_UserWithOrderModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserWithOrderModel(
      userId: json['userId'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      menuList: Map<String, int>.from(json['menuList'] as Map),
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$_UserWithOrderModelToJson(
        _$_UserWithOrderModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'orderDate': instance.orderDate.toIso8601String(),
      'menuList': instance.menuList,
      'nickname': instance.nickname,
    };
