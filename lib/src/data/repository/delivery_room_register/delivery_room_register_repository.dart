import 'package:share_delivery/src/data/provider/delivery_room_register/delivery_room_register_api_client.dart';

class DeliveryRoomRegisterRepository {
  // TODO : API 통신을 위한 클래스 주입할 것
  final DeliveryRoomRegisterApiClient apiClient;

  DeliveryRoomRegisterRepository({required this.apiClient});

  Future<bool> registerDeliveryRoom(Map deliveryRoom) async {
    return apiClient.registerDeliveryRoom(deliveryRoom);
  }
}
