import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_history_model.freezed.dart';
part 'delivery_history_model.g.dart';

@Freezed()
class DeliveryHistoryModel with _$DeliveryHistoryModel {
  const factory DeliveryHistoryModel({
    required String leaderName,
    required String content,
    required int peopleNumber,
    required int limitPerson,
    required String storeName,
    required PlatformType platformType,
    required DeliveryRoomStatus status,
    required String receivingLocationDesc,
    required StoreCategory storeCategory,
  }) = _DeliveryHistoryModel;

  factory DeliveryHistoryModel.fromJson(Map<String, Object?> json) =>
      _$DeliveryHistoryModelFromJson(json);
}

enum PlatformType {
  @JsonValue('BAEMIN')
  BAEMIN,
  @JsonValue('YOGIYO')
  YOGIYO
}
enum DeliveryRoomStatus {
  @JsonValue('OPEN')
  OPEN, //인원 모집 중
  @JsonValue('WAITING_PAYMENT')
  WAITING_PAYMENT, //주도자가 계산서 올리기를 기다리는 중
  @JsonValue('WAITING_DELIVERY')
  WAITING_DELIVERY, // 배달을 기다리는 중
  @JsonValue('WAITING_REMITTANCE')
  WAITING_REMITTANCE, // 송금을 기다리는 중
  @JsonValue('COMPLETED')
  COMPLETED // 모두 완료
}
enum StoreCategory {
  @JsonValue('CHICKEN')
  CHICKEN
}
