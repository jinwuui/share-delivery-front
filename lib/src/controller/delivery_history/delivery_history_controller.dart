import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_res_dto.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class DeliveryHistoryController extends GetxController {
  static DeliveryHistoryController get to => Get.find();
  late final DeliveryHistoryRepository deliveryHistoryRepository;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  DeliveryHistoryController() {
    Dio dio = DioUtil.getDio();
    final String host = dotenv.get('SERVER_HOST');

    deliveryHistoryRepository = DeliveryHistoryRepository(
      apiClient: DeliveryHistoryApiClient(dio, baseUrl: host),
    );
  }

  final historyPostList = <DeliveryHistoryResDTO>[].obs;

  get postList => historyPostList;
  set postList(posts) => historyPostList.value = posts;

  Future<void> onRefresh() async {
    try {
      historyPostList.value =
          await deliveryHistoryRepository.getDeliveryHistoryAll();

      refreshController.refreshCompleted();
    } catch (e) {
      Logger().e(e);
    }
  }
}
