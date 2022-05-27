import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class FriendController extends GetxController with StateMixin<List<User>> {
  final ProfileRepository repository;

  static FriendController get to => Get.find();
  FriendController({required this.repository});

  final friends = [].obs;

  @override
  void onReady() async {
    super.onReady();
    Logger().d("FriendController");

    try {
      change(null, status: RxStatus.loading());

      friends.value = await getFriendList();

      // change(deliveryRoom.value, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<List<User>> getFriendList() async {
    return await repository.getFriendList();
  }
}
