import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRoomInfoDetailController extends GetxController {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRoomInfoDetailController get to => Get.find();
  DeliveryRoomInfoDetailController({required this.repository});

  // late final Rx<DeliveryRoom> deliveryRoom;
  Rx<DeliveryRoom> deliveryRoom = DeliveryRoom(
    roomId: 456,
    leader: Leader(nickname: "종달새 1호", mannerScore: 36.7, accountId: 2),
    content: "BBQ 드실분?",
    person: 1,
    limitPerson: 3,
    deliveryTip: 3000,
    storeLink: "www.baemin.com/stores?id=1524",
    platformType: "BAEMIN",
    status: "OPEN",
    createdDateTime: DateTime.now().subtract(Duration(minutes: 7)),
    receivingLocation: ReceivingLocation(
      description: "CU 편의점 앞",
      lat: 35.820848788632226,
      lng: 128.518205019348,
    ),
    storeCategory: 'CHICKEN',
  ).obs;
  final isLoad = false.obs;

  @override
  void onInit() async {
    super.onInit();
    int deliveryRoomId = Get.arguments['deliveryRoomId'];
    try {
      deliveryRoom.value = await getDeliveryRoomInfo(deliveryRoomId);
      isLoad.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future<DeliveryRoom> getDeliveryRoomInfo(int deliveryRoomId) async {
    return await repository.getDeliveryRoomInfoDetail(deliveryRoomId);
  }
}
