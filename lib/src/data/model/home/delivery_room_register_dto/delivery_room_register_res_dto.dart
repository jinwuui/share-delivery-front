import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_room_register_res_dto.freezed.dart';
part 'delivery_room_register_res_dto.g.dart';

@Freezed()
class DeliveryRoomRegisterResDTO with _$DeliveryRoomRegisterResDTO {
  const factory DeliveryRoomRegisterResDTO({
    int? roomId,
  }) = _DeliveryRoomRegisterResDTO;

  factory DeliveryRoomRegisterResDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRoomRegisterResDTOFromJson(json);
}
