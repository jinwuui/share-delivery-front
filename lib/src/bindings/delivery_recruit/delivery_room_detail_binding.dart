import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_tab_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/order_form_register_controller.dart';
import 'package:share_delivery/src/controller/receiving_location/receiving_location_controller.dart';
import 'package:share_delivery/src/data/provider/delivery_order_detail/delivery_order_detail_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_order_detail/delivery_order_detail_repository.dart';

class DeliveryRoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = Dio();
    dio.options.contentType = "application/json";
    final String? host = dotenv.env['SERVER_HOST'];

    Get.put(DeliveryRoomInfoDetailController(
      repository: DeliveryOrderDetailRepository(
        apiClient: DeliveryOrderDetailApiClient(dio, baseUrl: host!),
      ),
    ));
    Get.put(ReceivingLocationController());
    Get.put(DeliveryOrderTabController());
    Get.put(DeliveryRecruitController(
      repository: DeliveryOrderDetailRepository(
        apiClient: DeliveryOrderDetailApiClient(dio, baseUrl: host),
      ),
    ));
    Get.put(DeliveryOrderController());

    Get.put(OrderFormRegisterController(
      repository: DeliveryOrderDetailRepository(
        apiClient: DeliveryOrderDetailApiClient(dio, baseUrl: host),
      ),
    ));
  }
}
