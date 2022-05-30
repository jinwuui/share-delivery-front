import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';

class DeliveryHistoryRepository {
  final DeliveryHistoryApiClient apiClient;

  DeliveryHistoryRepository({required this.apiClient});

  // Future<bool> registerDeliveryRoom(Map deliveryRoom) async {
  //   return apiClient.registerDeliveryRoom(deliveryRoom);
  // }

  Future<List<DeliveryRoom>> getAll() async {
    List<DeliveryRoom> list = [
      DeliveryRoom(
        leader: Leader(nickname: "종달새 1호", mannerScore: 36.7, accountId: 100),
        content: "굽네치킨 드실분?",
        person: 2,
        limitPerson: 4,
        deliveryTip: 3000,
        storeLink: "www.baemin.com/stores?id=1524",
        platformType: "BAEMIN",
        status: "OPEN",
        createdDateTime: DateTime.now().subtract(Duration(minutes: 7)),
        receivingLocation: ReceivingLocation(
            description: "CU 편의점 앞",
            lat: 35.821730657601044,
            lng: 128.5190184847488),
        roomId: 123,
        storeCategory: 'CHICKEN',
      ),
    ];
    await Future.delayed(Duration(seconds: 1));
    return list;
    return apiClient.getDeliveryHistoryAll();
  }
}
