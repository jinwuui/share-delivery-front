import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
import 'package:share_delivery/src/data/model/home/delivery_room_register_dto/delivery_room_register_dto.dart';
import 'package:share_delivery/src/data/model/home/delivery_room_register_dto/delivery_room_register_res_dto.dart';
import 'package:share_delivery/src/data/provider/delivery_room_register/delivery_room_register_api_client.dart';

class DeliveryRoomRegisterRepository {
  final DeliveryRoomRegisterApiClient apiClient;

  DeliveryRoomRegisterRepository({required this.apiClient});

  Future<int?> registerDeliveryRoom(Map<String, dynamic> deliveryRoom) async {
    // NOTE: 사용자 입력에서 집결지 데이터 추출  // 서버에 전송해서 집결지 등록
    print('1 - DeliveryRoomRegisterRepository.registerDeliveryRoom');
    print("type test ${deliveryRoom["receivingLocation"].runtimeType}");
    // deliveryRoom["receivingLocation"]["id"] = -1;
    print("${deliveryRoom["receivingLocation"]}");

    ReceivingLocation body =
        ReceivingLocation.fromJson(deliveryRoom["receivingLocation"]);
    print("body $body");

    ReceivingLocation? resReceivingLocation =
        await apiClient.registerReceivingLocation(body);

    print('DeliveryRoomRegisterRepository.registerDeliveryRoom');
    print(resReceivingLocation);

    if (resReceivingLocation == null) throw Exception("ERROR: 집결지 ID 없음");

    print('2 - receiving location 등록 성공');
    // 기존의 집결지 데이터는 서버에 보냈으니까 삭제
    deliveryRoom.remove("receivingLocation");
    // 집결지 데이터 대신에 집결지 ID 첨부
    deliveryRoom["receivingLocationId"] = resReceivingLocation.id;

    final List<Menu> menuList = deliveryRoom["menuList"];
    deliveryRoom.remove("menuList");
    DeliveryRoomRegisterDTO roomObj =
        DeliveryRoomRegisterDTO.fromJson(deliveryRoom);

    final newRoom = DeliveryRoomRegisterDTO(
      content: roomObj.content,
      deliveryTip: roomObj.deliveryTip,
      limitPerson: roomObj.limitPerson,
      receivingLocationId: roomObj.receivingLocationId,
      shareStore: roomObj.shareStore,
      storeCategory: roomObj.storeCategory,
      menuList: menuList,
    );

    print(newRoom);
    DeliveryRoomRegisterResDTO result =
        await apiClient.registerDeliveryRoom(newRoom);
    print("결과 $result");

    return result.roomId;
  }
}
