import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/profile/profile.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class OtherUserProfileController extends GetxController {
  final ProfileRepository repository;

  static OtherUserProfileController get to => Get.find();
  OtherUserProfileController({required this.repository});

  final isLoad = false.obs;
  final user = ProfileModel(
    accountId: 0,
    nickname: '',
    createdDate: DateTime.now(),
    modifiedDate: DateTime.now(),
    mannerScore: 0.0,
  ).obs;

  @override
  void onInit() async {
    final int accountId = Get.arguments['accountId'];
    await fetchUserInfo(accountId);
    super.onInit();
  }

  Future<void> fetchUserInfo(int accountId) async {
    try {
      ProfileModel userModel = await repository.fetchUserInfo(accountId);

      isLoad.value = true;
      user.value = userModel;
    } catch (e) {
      Logger().w(e);
    }
  }
}
