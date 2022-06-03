import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  late final ProfileRepository repository;

  ProfileController() {
    Dio dio = DioUtil.getDio();
    final String? host = dotenv.env['SERVER_HOST'];

    repository =
        ProfileRepository(apiClient: ProfileApiClient(dio, baseUrl: host!));
  }

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
    final int accountId =
        (AuthenticationController.to.state.props.first as User).accountId;

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
