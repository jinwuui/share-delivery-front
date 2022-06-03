import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRecruitController extends GetxController
    with StateMixin<List<OrderMenuModel>> {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRecruitController get to => Get.find();
  DeliveryRecruitController({required this.repository});

  final orderMenuList = <OrderMenuModel>[].obs;
  final totalPaymentMoney = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ever(orderMenuList, (_) {
      calculateTotalPaymentMoney();
    });
  }

  @override
  void onReady() async {
    super.onReady();
    int deliveryRoomId = Get.arguments['deliveryRoomId'];
    await getOrderList(deliveryRoomId: deliveryRoomId);
  }

  Future<void> getOrderList({deliveryRoomId}) async {
    Logger().w("getOrderList");
    try {
      change(null, status: RxStatus.loading());
      int deliveryRoomId = Get.arguments['deliveryRoomId'];

      orderMenuList.value = await repository.getOrderList(deliveryRoomId);

      change(orderMenuList, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> addUserWithOrder(OrderMenuModel userWithOrderModel) async {
    orderMenuList.add(userWithOrderModel);
  }

  Future<void> deleteUserWithOrder(int userId) async {
    try {
      int roomId = DeliveryRoomInfoDetailController.to.deliveryRoom.roomId;
      await repository.rejectUserOrder(userId, roomId);

      orderMenuList.value =
          orderMenuList.where((e) => e.accountId != userId).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<void> calculateTotalPaymentMoney() async {
    int totalMenuPrice = 0;

    for (var element in orderMenuList) {
      for (var e in element.menus) {
        totalMenuPrice += e.price;
      }
    }
    totalPaymentMoney.value = totalMenuPrice;
  }

  Future<void> completeRecurit() async {
    int roomId = DeliveryRoomInfoDetailController.to.deliveryRoom.roomId;
    await repository.completeDeliveryRecruit(roomId);
  }
}
