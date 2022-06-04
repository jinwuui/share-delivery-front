import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRoomInfoDetailController extends GetxController {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRoomInfoDetailController get to => Get.find();
  DeliveryRoomInfoDetailController({required this.repository});

  final roomId = 0.obs;
  late final DeliveryRoom deliveryRoom;
  final isLoad = false.obs;

  @override
  void onInit() async {
    super.onInit();

    roomId.value = Get.arguments['deliveryRoomId'];

    try {
      deliveryRoom = await getDeliveryRoomInfo(roomId.value);
      isLoad.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future<DeliveryRoom> getDeliveryRoomInfo(int deliveryRoomId) async {
    return await repository.getDeliveryRoomInfoDetail(deliveryRoomId);
  }
}
