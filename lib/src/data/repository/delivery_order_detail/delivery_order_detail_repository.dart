import 'dart:io';

import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/order_menu_model.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_order_detail/delivery_order_detail_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_req_dto.dart';

class DeliveryOrderDetailRepository {
  final DeliveryOrderDetailApiClient apiClient;

  DeliveryOrderDetailRepository({required this.apiClient});

  Future<int> completeDeliveryRecruit(int deliveryRoomId) async {
    return await apiClient.completeDeliveryRecruit(deliveryRoomId);
  }

  Future<DeliveryRoom> getDeliveryRoomInfoDetail(int deliveryRoomId) async {
    return await apiClient.getDeliveryRoomInfoDetail(deliveryRoomId);
  }

  Future<List<OrderMenuModel>> getOrderList(int deliveryRoomId) async {
    return await apiClient.getOrderList(deliveryRoomId);
  }

  // 주도자 배달 주문 정보 등록(B)
  Future<void> registerDeliveryRoomOrderDetail(
      {required DeliveryOrderDetailReqDTO deliveryOrderDetailDTO,
      required List<File> orderFormFileList,
      required int deliveryRoomId}) async {
    return await apiClient.registerDeliveryRoomOrderDeatil(
        deliveryRoomId, deliveryOrderDetailDTO, orderFormFileList);
  }

  Future<void> rejectUserOrder(int userId, int roomId) async {
    return await apiClient.rejectUserOrder(userId, roomId);
  }

  Future<int> deleteDeliveryRoom(int deliveryRoomId) async {
    return await apiClient.deleteDeliveryRoom(deliveryRoomId);
  }

  Future<void> exitDeliveryRoom(int deliveryRoomsId) async {
    return await apiClient.exitDeliveryRoom(deliveryRoomsId);
  }
}
