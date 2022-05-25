// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderMenuModel _$$_OrderMenuModelFromJson(Map<String, dynamic> json) =>
    _$_OrderMenuModel(
      entryOrderId: json['entryOrderId'] as int,
      accountId: json['accountId'] as int,
      phoneNumber: json['phoneNumber'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      menus: (json['menus'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdDateTime: DateTime.parse(json['createdDateTime'] as String),
    );

Map<String, dynamic> _$$_OrderMenuModelToJson(_$_OrderMenuModel instance) =>
    <String, dynamic>{
      'entryOrderId': instance.entryOrderId,
      'accountId': instance.accountId,
      'phoneNumber': instance.phoneNumber,
      'type': instance.type,
      'status': instance.status,
      'menus': instance.menus,
      'createdDateTime': instance.createdDateTime.toIso8601String(),
    };

_$_Menu _$$_MenuFromJson(Map<String, dynamic> json) => _$_Menu(
      orderMenuId: json['orderMenuId'] as int,
      menuName: json['menuName'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      optionMenus: (json['optionMenus'] as List<dynamic>?)
              ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MenuToJson(_$_Menu instance) => <String, dynamic>{
      'orderMenuId': instance.orderMenuId,
      'menuName': instance.menuName,
      'quantity': instance.quantity,
      'price': instance.price,
      'optionMenus': instance.optionMenus,
    };
