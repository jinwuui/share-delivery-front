import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_history/delivery_history_model.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';
import 'package:share_delivery/src/ui/delivery_history/delivery_history.dart';

class DeliveryHistoryController extends GetxController
    with StateMixin<List<DeliveryHistoryModel>> {
  static DeliveryHistoryController get to => Get.find();
  final DeliveryHistoryRepository deliveryHistoryRepository;

  DeliveryHistoryController({required this.deliveryHistoryRepository});

  final historyPostList = <DeliveryHistoryModel>[].obs;

  get postList => historyPostList;
  set postList(posts) => historyPostList.value = posts;

  @override
  void onReady() async {
    super.onReady();

    try {
      change(null, status: RxStatus.loading());
      historyPostList.value = await deliveryHistoryRepository.getAll();

      change(historyPostList, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }
}
