import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_order_detail_req_dto.freezed.dart';
part 'delivery_order_detail_req_dto.g.dart';

@Freezed()
class DeliveryOrderDetailReqDTO with _$DeliveryOrderDetailReqDTO {
  const factory DeliveryOrderDetailReqDTO({
    required List<DiscountModel> discounts,
  }) = _DeliveryOrderDetailReqDTO;

  factory DeliveryOrderDetailReqDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderDetailReqDTOFromJson(json);
}

@Freezed()
class DiscountModel with _$DiscountModel {
  const factory DiscountModel({
    required String paymentDiscountName,
    required int amount,
  }) = _DiscountModel;

  factory DiscountModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountModelFromJson(json);
}
