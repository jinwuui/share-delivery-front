import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/profile/profile.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
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
          profileImage: profileModel.profileImageUrl,
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
}
