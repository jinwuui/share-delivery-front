import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_room_register/delivery_room_register_api_client.dart';

class DeliveryRoomRegisterRepository {
  // TODO : API 통신을 위한 클래스 주입할 것
  final DeliveryRoomRegisterApiClient apiClient;

  DeliveryRoomRegisterRepository({required this.apiClient});

  Future<DeliveryRoom?> registerDeliveryRoom(
      Map<String, dynamic> deliveryRoom) async {
    // NOTE: 사용자 입력에서 집결지 데이터 추출  // 서버에 전송해서 집결지 등록
    Map<String, dynamic> receivingLocation = await apiClient
        .registerReceivingLocation(deliveryRoom["receivingLocation"]);

    if (receivingLocation["id"] == null) throw Exception("ERROR: 집결지 ID 없음");

    // 기존의 집결지 데이터는 서버에 보냈으니까 삭제
    deliveryRoom.remove("receivingLocation");
    // 집결지 데이터 대신에 집결지 ID 첨부
    deliveryRoom["receivingLocationId"] = receivingLocation["id"];

    return apiClient.registerDeliveryRoom(deliveryRoom);
  }
}
