import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_history_res_dto.freezed.dart';
part 'delivery_history_res_dto.g.dart';

@Freezed()
class DeliveryHistoryResDTO with _$DeliveryHistoryResDTO {
  const factory DeliveryHistoryResDTO({
    required int roomId,
    required String leaderName,
    required String content,
    required int peopleNumber,
    required int limitPerson,
    required String storeName,
    required String platformType,
    required DateTime createDateTime,
    required String status,
    required String receivingLocationDesc,
    required String storeCategory,
  }) = _DeliveryHistoryResDTO;

  factory DeliveryHistoryResDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryHistoryResDTOFromJson(json);
}
