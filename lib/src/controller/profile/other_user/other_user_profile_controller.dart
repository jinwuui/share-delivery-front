import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class OtherUserProfileController extends GetxController {
  final ProfileRepository repository;

  static OtherUserProfileController get to => Get.find();
  OtherUserProfileController({required this.repository});

  final isLoad = false.obs;
  final user = User(
          accountId: 0,
          phoneNumber: '',
          nickname: 'nickname',
          status: 'status',
          role: 'role')
      .obs;

  @override
  void onInit() {
    final int accountId = Get.arguments['accountId'];
    fetchUserInfo(accountId);
    super.onInit();
  }

  Future<void> fetchUserInfo(int accountId) async {
    try {
      User userModel = await repository.fetchUserInfo(accountId);

      isLoad.value = true;
      user.value = userModel;
      Logger().w(userModel);
    } catch (e) {
      Logger().w(e);
    }
  }
}
