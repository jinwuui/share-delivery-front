import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_history/delivery_history_controller.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';

class DeliveryHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Dio dio = Dio();
    final String? host = dotenv.env['SERVER_HOST'];
    Get.put<DeliveryHistoryController>(DeliveryHistoryController(
      deliveryHistoryRepository: DeliveryHistoryRepository(
        apiClient: DeliveryHistoryApiClient(dio, baseUrl: host!),
      ),
    ));
  }
}
