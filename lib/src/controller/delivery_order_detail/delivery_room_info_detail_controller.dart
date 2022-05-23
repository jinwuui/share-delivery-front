import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/delivery_room/leader.dart';
import 'package:share_delivery/src/data/model/delivery_room/receiving_location.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRoomInfoDetailController extends GetxController
    with StateMixin<DeliveryRoom> {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRoomInfoDetailController get to => Get.find();
  DeliveryRoomInfoDetailController({required this.repository});

  // late final Rx<DeliveryRoom> deliveryRoom;
  Rx<DeliveryRoom> deliveryRoom = DeliveryRoom(
    deliveryRoomId: "test",
    leader: Leader(mannerScore: 0, nickname: ''),
    content: "",
    limitPerson: 0,
    shareStoreLink: "",
    linkPlatformType: "",
    status: "",
    createdDate: DateTime.now(),
    receivingLocation: ReceivingLocation(
      description: "",
      latitude: 0,
      longitude: 0,
    ),
  ).obs;

  @override
  void onReady() async {
    super.onReady();
    Logger().d("DeliveryRoomInfoDetailController");

    String deliveryRoomId = Get.arguments['deliveryRoomId'];

    try {
      change(null, status: RxStatus.loading());

      deliveryRoom.value =
          await repository.getDeliveryRoomInfoDetail(deliveryRoomId);

      change(deliveryRoom.value, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> getDeliveryRoomInfo() async {}
}
