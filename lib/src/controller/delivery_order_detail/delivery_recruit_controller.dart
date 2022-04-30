import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_order_detail/user_with_order_model.dart';

class DeliveryRecruitController extends GetxController {
  DeliveryRecruitController();

  final userWithOrderList = <UserWithOrderModel>[].obs;

  Future<void> addUserWithOrder(UserWithOrderModel userWithOrderModel) async {
    userWithOrderList.add(userWithOrderModel);
  }

  Future<void> deleteUserWithOrder(String userId) async {
    userWithOrderList.value =
        userWithOrderList.where((e) => e.userId != userId).toList();
  }
}
