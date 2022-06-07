import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/controller/profile/friend/friend_controller.dart';
import 'package:share_delivery/src/data/model/profile/profile.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/services/setting_service.dart';
import 'package:share_delivery/src/ui/login/state/authentication_state.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  late final ProfileRepository repository;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  ProfileController() {
    Dio dio = DioUtil.getDio();
    final String? host = dotenv.env['SERVER_HOST'];

    repository =
        ProfileRepository(apiClient: ProfileApiClient(dio, baseUrl: host!));
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchUserInfo(int accountId) async {
    try {
      ProfileModel profileModel = await repository.fetchUserInfo(accountId);

      AuthenticationController.to.state = Authenticated(
        user: (AuthenticationController.to.state.props.first as User).copyWith(
          accountId: profileModel.accountId,
          nickname: profileModel.nickname,
          profileImageUrl: profileModel.profileImageUrl,
          mannerScore: profileModel.mannerScore,
        ),
      );
    } catch (e) {
      Logger().w(e);
    }
  }

  void onRefresh() async {
    final int accountId =
        (AuthenticationController.to.state.props.first as User).accountId;

    await fetchUserInfo(accountId);

    refreshController.refreshCompleted();
  }

  Future<void> deleteFriend(int accountId) async {
    try {
      String res = await repository.deleteFriend(accountId);

      Get.back();

      if (int.parse(res) == accountId) {
        if (Get.isRegistered<FriendController>()) {
          FriendController.to.getFriendList();
        }
        Get.snackbar("삭제 성공", "친구가 삭제되었습니다.",
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            duration: Duration(seconds: 1));
      } else {
        Get.snackbar("삭제 실패", "친구 삭제에 실패하였습니다.",
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            duration: Duration(seconds: 1));
      }
    } catch (err) {
      Logger().w(err);
    }
  }

  Future<void> addFriend(int accountId) async {
    try {
      int res = await repository.addFriend(accountId);
      if (res == accountId) {
        Get.snackbar("친구 신청", "친구를 신청하였습니다.",
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            duration: Duration(seconds: 1));
      } else {
        Get.snackbar("친구 추가 실패", "친구 추가에 실패하였습니다.",
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            duration: Duration(seconds: 1));
      }
    } catch (err) {
      Logger().w(err);
    }
  }

  Future<void> acceptFriend(int accountId, FriendAcceptState friendType) async {
    try {
      String res = await repository.acceptFriend(accountId, friendType.index);
      Get.back();
    } catch (e) {
      Logger().w(e);
    }
  }
}
