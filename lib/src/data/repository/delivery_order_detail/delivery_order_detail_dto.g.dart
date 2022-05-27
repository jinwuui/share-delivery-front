// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryOrderDetailDTO _$$_DeliveryOrderDetailDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DeliveryOrderDetailDTO(
      orders: json['orders'] as String,
      totalOrderPrice: json['totalOrderPrice'] as int,
      deliveryTip: json['deliveryTip'] as int,
      discounts:
          (json['discounts'] as List<dynamic>).map((e) => e as int).toList(),
      totalPaymentPrice: json['totalPaymentPrice'] as int,
    );

Map<String, dynamic> _$$_DeliveryOrderDetailDTOToJson(
        _$_DeliveryOrderDetailDTO instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'totalOrderPrice': instance.totalOrderPrice,
      'deliveryTip': instance.deliveryTip,
      'discounts': instance.discounts,
      'totalPaymentPrice': instance.totalPaymentPrice,
    };
