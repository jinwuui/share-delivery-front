import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRoomInfoDetailController extends GetxController
    with StateMixin<DeliveryRoom> {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRoomInfoDetailController get to => Get.find();
  DeliveryRoomInfoDetailController({required this.repository});

  // late final Rx<DeliveryRoom> deliveryRoom;
  Rx<DeliveryRoom> deliveryRoom = DeliveryRoom(
    roomId: 456,
    leader: Leader(nickname: "종달새 1호", mannerScore: 36.7),
    content: "BBQ 드실분?",
    person: 1,
    limitPerson: 3,
    deliveryTip: 3000,
    storeLink: "www.baemin.com/stores?id=1524",
    platformType: "BAEMIN",
    status: "NULL",
    createdDateTime: DateTime.now().subtract(Duration(minutes: 7)),
    receivingLocation: ReceivingLocation(
      description: "CU 편의점 앞",
      latitude: 35.820848788632226,
      longitude: 128.518205019348,
    ),
  ).obs;

  @override
  void onReady() async {
    super.onReady();
    Logger().d("DeliveryRoomInfoDetailController");

    String deliveryRoomId = Get.arguments['deliveryRoomId'];

    try {
      change(null, status: RxStatus.loading());

      deliveryRoom.value = await getDeliveryRoomInfo(deliveryRoomId);

      change(deliveryRoom.value, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<DeliveryRoom> getDeliveryRoomInfo(String deliveryRoomId) async {
    return await repository.getDeliveryRoomInfoDetail(deliveryRoomId);
  }
}
