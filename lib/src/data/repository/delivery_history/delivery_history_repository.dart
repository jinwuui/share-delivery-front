import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_res_dto.dart';

class DeliveryHistoryRepository {
  final DeliveryHistoryApiClient apiClient;

  DeliveryHistoryRepository({required this.apiClient});

  // Future<bool> registerDeliveryRoom(Map deliveryRoom) async {
  //   return apiClient.registerDeliveryRoom(deliveryRoom);
  // }

  Future<List<DeliveryHistoryResDTO>> getDeliveryHistoryAll() async {
    return await apiClient.getDeliveryHistoryAll();
  }
}
