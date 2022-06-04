import 'package:get/get.dart';
import 'package:share_delivery/src/controller/profile/app_setting/app_setting_controller.dart';
import 'package:share_delivery/src/data/provider/profile/app_setting/app_setting_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/app_setting/app_setting_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class AppSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AppSettingController(
        repository: AppSettingRepository(
          apiClient: AppSettingApiClient(DioUtil.getDio()),
          // localClient:
        ),
      ),
    );
  }
}
