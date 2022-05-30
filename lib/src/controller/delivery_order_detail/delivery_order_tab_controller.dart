import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrderTabController extends GetxController
    with GetTickerProviderStateMixin {
  List<Tab> tabChildParameters = [
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child: Text("상세 정보"),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child: Text("주문 정보"),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child: Text("채팅방"),
      ),
    ),
  ];
  static DeliveryOrderTabController get to => Get.find();
  DeliveryOrderTabController();

  late TabController controller;

  @override
  void onInit() {
    print("Delivery Order Controller INit");

    super.onInit();
    controller = TabController(
        vsync: this, length: tabChildParameters.length, initialIndex: 0);
    update();
  }

  void asyncLoadTabs({int index = 0}) async {
    controller.dispose(); // release animation resources
    controller = TabController(
        vsync: this,
        length: tabChildParameters.length,
        initialIndex: index // to show a particular tab on create
        );
    update();
  }

  void switchTab(int index) async {
    asyncLoadTabs(index: index);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
