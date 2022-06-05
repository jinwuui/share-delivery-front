import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';
import 'package:share_delivery/src/routes/route.dart';

class DeliveryRecruitController extends GetxController
    with StateMixin<List<OrderMenuModel>> {
  final DeliveryOrderDetailRepository repository;

  static DeliveryRecruitController get to => Get.find();
  DeliveryRecruitController({required this.repository});

  final orderMenuList = <OrderMenuModel>[].obs;
  final totalPaymentMoney = 0.obs;
  late final int deliveryRoomId;

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
    deliveryRoomId = Get.arguments['deliveryRoomId'];
    await getOrderList(deliveryRoomId: deliveryRoomId);
  }

  Future<void> getOrderList({deliveryRoomId}) async {
    try {
      change(null, status: RxStatus.loading());
      int deliveryRoomId = Get.arguments['deliveryRoomId'];

      orderMenuList.value = await repository.getOrderList(deliveryRoomId);

      Logger().d("getOrderList success");

      change(orderMenuList, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> addUserWithOrder(OrderMenuModel userWithOrderModel) async {
    orderMenuList.add(userWithOrderModel);
  }

  Future<void> deleteUserWithOrder(int userId) async {
    await Get.dialog(AlertDialog(
      title: Text("주문 거절"),
      content: Text("해당 사용자의 주문을 거절하시겠습니까?"),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: Text("취소"),
          onPressed: () {
            Get.back();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: Text(
            "확인",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            try {
              int roomId =
                  DeliveryRoomInfoDetailController.to.deliveryRoom.roomId;
              await repository.rejectUserOrder(userId, roomId);

              orderMenuList.value =
                  orderMenuList.where((e) => e.accountId != userId).toList();
              Get.back();
              Get.snackbar("주문 취소", "다른 사용자의 주문을 취소하였습니다.");
            } catch (e) {
              Get.back();
              Get.snackbar("주문 취소 실패", "다른 사용자의 주문을 취소하는데 실패하였습니다.");
              Logger().w(e);
            }
          },
        ),
      ],
    ));
  }

  Future<void> calculateTotalPaymentMoney() async {
    int totalMenuPrice = 0;

    for (var element in orderMenuList) {
      for (var e in element.menus) {
        totalMenuPrice += e.price * e.quantity;
        totalMenuPrice += e.optionMenus.fold(
            0,
            (previousValue, element) =>
                previousValue + element.price * e.quantity);
      }
    }
    totalPaymentMoney.value = totalMenuPrice;
  }

  Future<void> completeRecurit() async {
    try {
      int res = await repository.completeDeliveryRecruit(deliveryRoomId);
      if (res != deliveryRoomId) {
        throw Exception();
      }
      Get.snackbar(
        "주문 진행 확인",
        "주문 상세 정보 입력 페이지로 이동",
        backgroundColor: Colors.white,
        duration: Duration(
          seconds: 1,
        ),
      );
    } catch (e) {
      Get.snackbar(
        "주문 진행 확인",
        "주문 상세 정보 입력 페이지로 이동 실패",
        backgroundColor: Colors.white,
        duration: Duration(
          seconds: 1,
        ),
      );
      Logger().w(e);
    }
  }

  Future<void> deleteDeliveryRoom(int deliveryRoomId) async {
    try {
      await Get.dialog(AlertDialog(
        title: Text("모집글 삭제"),
        content: Text("모집글을 삭제하시겠습니까?"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Text("취소"),
            onPressed: () {
              Get.back();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Text(
              "확인",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              try {
                int res = await repository.deleteDeliveryRoom(deliveryRoomId);

                if (res != deliveryRoomId) {
                  throw Exception();
                }

                Get.offAllNamed('/');
                Get.snackbar("삭제 완료", "모집글이 삭제되었습니다.");
              } catch (e) {
                Get.back();
                Get.back();
                Get.snackbar("오류", "모집글을 삭제할 수 있는 상태가 아닙니다.");
              }
            },
          ),
        ],
      ));
    } catch (e) {
      print(e);
    }
  }

  Future<void> exitDeliveryRoom(int deliveryRoomsId) async {
    await repository.exitDeliveryRoom(deliveryRoomsId);
  }
}
