import 'package:get/get.dart';

class DeliveryHistoryController extends GetxController {
  DeliveryHistoryController();

  final historyPostList = <DeliveryHistoryModel>[].obs;

  get postList => historyPostList;
  set postList(posts) => historyPostList.value = posts;
}

class DeliveryHistoryModel {}
