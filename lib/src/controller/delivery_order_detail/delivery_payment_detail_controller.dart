import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/remittance_res_dto.dart';
import 'package:share_delivery/src/data/provider/delivery_order_detail/delivery_order_detail_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_payment_detail_res_dto.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class DeliveryPaymentDetailController extends GetxController {
  late final DeliveryOrderDetailRepository repository;

  static DeliveryPaymentDetailController get to => Get.find();

  DeliveryPaymentDetailController() {
    Dio dio = DioUtil.getDio();
    final String host = dotenv.get('SERVER_HOST');

    repository = DeliveryOrderDetailRepository(
      apiClient: DeliveryOrderDetailApiClient(dio, baseUrl: host),
    );
  }

  final isLoad = false.obs;
  final roomId = 0.obs;
  final remittances = <RemittanceResDTO>[].obs;
  late final DeliveryPaymentDetailResDTO deliveryPaymentDetail;

  @override
  void onInit() async {
    super.onInit();
    ever(remittances, (_) {
      print('$_이 변경되었습니다.');
    });

    roomId.value = DeliveryRoomInfoDetailController.to.deliveryRoom.roomId;

    try {
      deliveryPaymentDetail = await getDeliveryPaymentDetail(roomId.value);
      remittances.value = await getRemittance(roomId.value);

      isLoad.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future<DeliveryPaymentDetailResDTO> getDeliveryPaymentDetail(
      int deliveryRoomId) async {
    return await repository.getDeliveryPaymentDetail(deliveryRoomId);
  }

  Future<List<RemittanceResDTO>> getRemittance(int roomId) async {
    return await repository.getRemittance(roomId);
  }

  Future<void> checkRemittance(int remittanceId) async {
    try {
      int roomId = deliveryPaymentDetail.roomId;
      // 성공 true
      bool res = await repository.checkRemittance(roomId, remittanceId);

      if (!res) throw Exception();

      remittances.value = await getRemittance(roomId);

      Get.snackbar(
        "성공",
        "입금 확인 완료",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> completeDelivery() async {
    try {
      int roomId = deliveryPaymentDetail.roomId;

      await repository.completeDelivery(roomId);

      Get.snackbar(
        "성공",
        "배달 완료",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 1),
      );
    } catch (e) {
      print(e);
    }
  }
}
