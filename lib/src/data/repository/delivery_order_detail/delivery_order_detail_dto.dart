import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_order_detail_dto.freezed.dart';
part 'delivery_order_detail_dto.g.dart';

@Freezed()
class DeliveryOrderDetailDTO with _$DeliveryOrderDetailDTO {
  const factory DeliveryOrderDetailDTO({
    required String orders,
    required int totalOrderPrice,
    required int deliveryTip,
    required List<int> discounts,
    required int totalPaymentPrice,
  }) = _DeliveryOrderDetailDTO;

  factory DeliveryOrderDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderDetailDTOFromJson(json);
}
