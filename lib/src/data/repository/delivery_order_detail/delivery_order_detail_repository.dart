import 'dart:io';

import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/data/model/chat/chat.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_order_detail/delivery_order_detail_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_dto.dart';

class DeliveryOrderDetailRepository {
  final DeliveryOrderDetailApiClient apiClient;

  DeliveryOrderDetailRepository({required this.apiClient});

  completeDeliveryRecruit(int deliveryRoomId) async {
    return await apiClient.completeDeliveryRecruit(deliveryRoomId);
  }

  Future<DeliveryRoom> getDeliveryRoomInfoDetail(int deliveryRoomId) async {
    await Future.delayed(Duration(seconds: 2));

    return DeliveryRoom(
      leader: Leader(nickname: "종달새 1호", mannerScore: 36.7, accountId: 100),
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
          latitude: 35.820848788632226,
          longitude: 128.518205019348),
      roomId: 456,
      storeCategory: 'CHICKEN',
    );
    return await apiClient.getDeliveryRoomInfoDetail(deliveryRoomId);
  }

  Future<List<OrderMenuModel>> getOrderList(int deliveryRoomId) async {
    await Future.delayed(Duration(seconds: 2));
    List<OrderMenuModel> list = [
      OrderMenuModel(
        entryOrderId: 1,
        accountId: 100,
        phoneNumber: "01000000001",
        type: "hello",
        status: "world",
        menus: [
          Menu(
            orderMenuId: 3,
            menuName: "황금올리브",
            quantity: 1,
            price: 15000,
          ),
          Menu(
            orderMenuId: 3,
            menuName: "치즈볼",
            quantity: 1,
            price: 5000,
          ),
        ],
        createdDateTime: DateTime.now(),
      ),
      OrderMenuModel(
        entryOrderId: 1,
        accountId: 2,
        phoneNumber: "01000000001",
        type: "hello",
        status: "world",
        menus: [
          Menu(
            orderMenuId: 3,
            menuName: "황금올리브",
            quantity: 1,
            price: 15000,
          ),
          Menu(
            orderMenuId: 3,
            menuName: "치즈볼",
            quantity: 1,
            price: 5000,
          ),
        ],
        createdDateTime: DateTime.now(),
      ),
    ];
    return list;
    return apiClient.getOrderList(deliveryRoomId);
  }

  // 주도자가 배달 주문 정보 등록
  Future<void> registerDeliveryRoomOrderDetail() async {
    DeliveryOrderDetailDTO deliveryOrderDetailDTO = DeliveryOrderDetailDTO(
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
        deliveryRoomId, deliveryOrderDetailDTO, orderFormFileList);
  }

  Future<void> rejectUserOrder(int userId, int roomId) async {
    return await apiClient.rejectUserOrder(userId, roomId);
  }

  // read chat message list
  // Future<List<ChatModel>> readChatList(int roomId) async {
  //   return await apiClient.readChatList(roomId);
  // }
}
