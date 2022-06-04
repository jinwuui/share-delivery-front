import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/provider/delivery_history/delivery_history_api_client.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_res_dto.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class DeliveryHistoryController extends GetxController
    with StateMixin<List<DeliveryHistoryResDTO>> {
  static DeliveryHistoryController get to => Get.find();
  late final DeliveryHistoryRepository deliveryHistoryRepository;

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

  @override
  void onReady() async {
    super.onReady();
    await fetchDeliveryHistoryPost();
  }

  // 모집글 히스토리 목록 조회
  Future<void> fetchDeliveryHistoryPost() async {
    try {
      change(null, status: RxStatus.loading());
      historyPostList.value =
          await deliveryHistoryRepository.getDeliveryHistoryAll();

      change(historyPostList, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  // 모집글 히스토리 추가
  //    모집글 등록 시 사용
  Future<void> addPost(DeliveryHistoryResDTO deliveryHistoryModel) async {
    historyPostList.add(deliveryHistoryModel);
  }
}
