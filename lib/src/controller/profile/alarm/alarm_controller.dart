import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/friend_res_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class AlarmController extends GetxController {
  final ProfileRepository repository;

  static AlarmController get to => Get.find();
  AlarmController({required this.repository});

  final isLoad = false.obs;
  final friendAlarms = <FriendResDTO>[].obs;
  late final int accountId;
  @override
  void onInit() async {
    accountId =
        (AuthenticationController.to.state.props.first as User).accountId;
    await fetchFriendReqList(accountId);
    super.onInit();
  }

  Future<void> fetchFriendReqList(int accountId) async {
    try {
      String friendType = "RECEIVED_PENDING_REQUEST";
      List<FriendResDTO> friends = await repository.getFriendList(friendType);
      Logger().w(friends);
      isLoad.value = true;
      friendAlarms.value = friends;
    } catch (e) {
      Logger().w(e);
    }
  }
}
