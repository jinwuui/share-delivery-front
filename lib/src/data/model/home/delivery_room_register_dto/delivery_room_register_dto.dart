import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';

part 'delivery_room_register_dto.freezed.dart';
part 'delivery_room_register_dto.g.dart';

@Freezed()
class DeliveryRoomRegisterDTO with _$DeliveryRoomRegisterDTO {
  const factory DeliveryRoomRegisterDTO({
    required String content,
    required int deliveryTip,
    required int limitPerson,
    @Default([]) List<Menu> menuList,
    required int receivingLocationId,
    required ShareStore shareStore,
    required String storeCategory,
  }) = _DeliveryRoomRegisterDTO;

  factory DeliveryRoomRegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRoomRegisterDTOFromJson(json);
}

@Freezed()
class ShareStore with _$ShareStore {
  const factory ShareStore({
    required String link,
    required String name,
    required String type,
  }) = _ShareStore;

  factory ShareStore.fromJson(Map<String, dynamic> json) =>
      _$ShareStoreFromJson(json);
}
