import 'package:share_delivery/src/data/model/delivery_history/delivery_history_model.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';

class DeliveryHistoryRepository {
  final DeliveryHistoryApiClient apiClient;

  DeliveryHistoryRepository({required this.apiClient});

  // Future<bool> registerDeliveryRoom(Map deliveryRoom) async {
  //   return apiClient.registerDeliveryRoom(deliveryRoom);
  // }
  Future<List<DeliveryHistoryModel>> getAll() async {
    List<DeliveryHistoryModel> list = [
      DeliveryHistoryModel(
        leaderName: 'park',
        content: 'jin woo',
        peopleNumber: 2,
        limitPerson: 4,
        storeName: "투존치킨",
        platformType: PlatformType.BAEMIN,
        status: DeliveryRoomStatus.OPEN,
        receivingLocationDesc: "디지털관 앞",
        storeCategory: StoreCategory.CHICKEN,
      ),
      DeliveryHistoryModel(
        leaderName: 'park',
        content: 'jin woo',
        peopleNumber: 2,
        limitPerson: 4,
        storeName: "투존치킨",
        platformType: PlatformType.BAEMIN,
        status: DeliveryRoomStatus.OPEN,
        receivingLocationDesc: "디지털관 앞",
        storeCategory: StoreCategory.CHICKEN,
      ),
      DeliveryHistoryModel(
        leaderName: 'park',
        content: 'jin woo',
        peopleNumber: 2,
        limitPerson: 4,
        storeName: "투존치킨",
        platformType: PlatformType.BAEMIN,
        status: DeliveryRoomStatus.OPEN,
        receivingLocationDesc: "디지털관 앞",
        storeCategory: StoreCategory.CHICKEN,
      ),
    ];
    await Future.delayed(Duration(seconds: 2));
    return list;
    // return apiClient.getDeliveryHistoryAll();
  }
}
