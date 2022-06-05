import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
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
  late final DeliveryPaymentDetailResDTO deliveryPaymentDetail;

  @override
  void onInit() async {
    super.onInit();

    roomId.value = DeliveryRoomInfoDetailController.to.deliveryRoom.roomId;

    try {
      deliveryPaymentDetail = await getDeliveryPaymentDetail(roomId.value);

      isLoad.value = true;
    } catch (e) {
      print(e);
    }
  }

  Future<DeliveryPaymentDetailResDTO> getDeliveryPaymentDetail(
      int deliveryRoomId) async {
    return await repository.getDeliveryPaymentDetail(deliveryRoomId);
  }
}
