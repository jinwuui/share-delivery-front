import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/account/modify_account_controller.dart';
import 'package:share_delivery/src/controller/profile/alarm/alarm_controller.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class AlarmBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioUtil.getDio();
    final String? host = dotenv.env['SERVER_HOST'];

    Get.put(AlarmController(
      repository: ProfileRepository(
        apiClient: ProfileApiClient(dio, baseUrl: host!),
      ),
    ));
  }
}
