import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';

part 'delivery_payment_detail_res_dto.freezed.dart';
part 'delivery_payment_detail_res_dto.g.dart';

@Freezed()
class DeliveryPaymentDetailResDTO with _$DeliveryPaymentDetailResDTO {
  const factory DeliveryPaymentDetailResDTO({
    required int roomId,
    required Leader leader,
    required List<Order> orders,
    required List<Discount> discounts,
    required int deliveryFee,
    required int totalDiscountAmount,
    required ReceivingLocation receivingLocation,
    required List<String> orderFormUrlList,
  }) = _DeliveryPaymentDetailResDTO;

  factory DeliveryPaymentDetailResDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPaymentDetailResDTOFromJson(json);
}

@Freezed()
class Leader with _$Leader {
  const factory Leader({
    required int accountId,
    required String nickname,
    required BankAccount bankAccount,
  }) = _Leader;

  factory Leader.fromJson(Map<String, dynamic> json) => _$LeaderFromJson(json);
}

@Freezed()
class BankAccount with _$BankAccount {
  const factory BankAccount({
    required String accountHolder,
    required String bank,
    required String accountNumber,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}

@Freezed()
class Order with _$Order {
  const factory Order({
    required int entryOrderId,
    required int accountId,
    required String nickName,
    required String type,
    required String status,
    required List<Menu> menus,
    required DateTime createdDateTime,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@Freezed()
class Discount with _$Discount {
  const factory Discount({
    required DateTime createdDate,
    required DateTime modifiedDate,
    required String paymentDiscountName,
    required int amount,
  }) = _Discount;

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);
}
