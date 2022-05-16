import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
import 'package:share_delivery/src/data/provider/home/participate_room_api_client.dart';

class ParticipateRoomRepository {
  ParticipateRoomApiClient apiClient;

  ParticipateRoomRepository({required this.apiClient});

  Future<String> participateDeliveryRoom(
      int roomId, List<Menu> menuList) async {
    // return "ACCEPTED";
    print('ParticipateRoomRepository.participateDeliveryRoom');
    return await apiClient.requestParticipating(roomId, menuList);
  }
}
