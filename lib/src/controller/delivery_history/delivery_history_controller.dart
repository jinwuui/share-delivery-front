import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_history/delivery_history_model.dart';
import 'package:share_delivery/src/data/repository/delivery_history/delivery_history_repository.dart';

class DeliveryHistoryController extends GetxController {
  final DeliveryHistoryRepository deliveryHistoryRepository;
  DeliveryHistoryController({required this.deliveryHistoryRepository});

  final historyPostList = <DeliveryHistoryModel>[].obs;

  get postList => historyPostList;
  set postList(posts) => historyPostList.value = posts;
}
