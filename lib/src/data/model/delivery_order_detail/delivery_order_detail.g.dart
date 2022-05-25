// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryOrderDetailModel _$$_DeliveryOrderDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryOrderDetailModel(
      deliveryRoomId: json['deliveryRoomId'] as String,
      receivingLocation: ReceivingLocation.fromJson(
          json['receivingLocation'] as Map<String, dynamic>),
      orderList: (json['orderList'] as List<dynamic>)
          .map((e) => OrderMenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: DateTime.parse(json['createDate'] as String),
      totalOrderMoney: json['totalOrderMoney'] as int,
      deliveryTip: json['deliveryTip'] as int,
      discountInfoList: json['discountInfoList'] as String,
      totalPaymentMoney: json['totalPaymentMoney'] as int,
    );

Map<String, dynamic> _$$_DeliveryOrderDetailModelToJson(
        _$_DeliveryOrderDetailModel instance) =>
    <String, dynamic>{
      'deliveryRoomId': instance.deliveryRoomId,
      'receivingLocation': instance.receivingLocation,
      'orderList': instance.orderList,
      'createDate': instance.createDate.toIso8601String(),
      'totalOrderMoney': instance.totalOrderMoney,
      'deliveryTip': instance.deliveryTip,
      'discountInfoList': instance.discountInfoList,
      'totalPaymentMoney': instance.totalPaymentMoney,
    };
