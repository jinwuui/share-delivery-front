import 'dart:io';

import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/user_with_order_model.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_order_detail/delivery_order_detail_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_dto.dart';

class DeliveryOrderDetailRepository {
  final DeliveryOrderDetailApiClient apiClient;

  DeliveryOrderDetailRepository({required this.apiClient});

  completeDeliveryRecruit(String deliveryRoomId) async {
    return apiClient.completeDeliveryRecruit(deliveryRoomId);
  }

  Future<DeliveryRoom> getDeliveryRoomInfoDetail(String deliveryRoomId) async {
    await Future.delayed(Duration(seconds: 2));

    return DeliveryRoom(
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
          longitude: 128.518205019348),
      roomId: 456,
    );
    // return apiClient.getDeliveryRoomInfoDetail(deliveryRoomId);
  }

  Future<List<UserWithOrderModel>> getOrderList(String deliveryRoomId) async {
    await Future.delayed(Duration(seconds: 2));
    List<UserWithOrderModel> list = [
      UserWithOrderModel(
          userId: 'park',
          orderDate: DateTime.now(),
          nickname: "parkjinwoo",
          menuList: {"치즈볼": 5000, "황올 순살": 25000}),
      UserWithOrderModel(
          userId: 'jin',
          orderDate: DateTime.now(),
          nickname: "진우박",
          menuList: {"치즈볼": 5000, "황올 순살": 25000})
    ];
    return list;
    // return apiClient.getOrderList(deliveryRoomId);
  }

  Future<void> registerDeliveryRoomOrderDetail() async {
    DeliveryOrderDetailDTO deliveryOrderDetailDTO = DeliveryOrderDetailDTO(
        orderForms: "1",
        orders: "2",
        totalOrderPrice: 3333,
        deliveryTip: 4444,
        discounts: [],
        totalPaymentPrice: 5555);

    List<File> orderFormFileList = [];

    for (var element in OrderFormRegisterController.to.orderFormList) {
      orderFormFileList.add(File(element.path));
    }

    int deliveryRoomId =
        DeliveryRoomInfoDetailController.to.deliveryRoom.value.roomId;

    return await apiClient.registerDeliveryRoomOrderDeatil(
        deliveryRoomId.toString(), deliveryOrderDetailDTO, orderFormFileList);
  }
}
