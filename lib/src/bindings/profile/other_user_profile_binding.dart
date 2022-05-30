import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/other_user/other_user_profile_controller.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class OtherUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    // profile controller
    Dio dio = DioUtil.getDio();
    final String? host = dotenv.env['SERVER_HOST'];

    Get.put(OtherUserProfileController(
      repository: ProfileRepository(
        apiClient: ProfileApiClient(dio, baseUrl: host!),
      ),
    ));
  }
}
