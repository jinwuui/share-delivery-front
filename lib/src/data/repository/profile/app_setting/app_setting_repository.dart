import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/provider/profile/app_setting/app_setting_api_client.dart';

class AppSettingRepository {
  AppSettingApiClient apiClient;

  AppSettingRepository({required this.apiClient});

  // 로그아웃
  void logout() {
    print('AppSettingRepository.logout');
    AuthenticationController.to.logout();
  }

  // 회원 탈퇴
  Future<void> withdrawUser() async {
    await apiClient.withdrawUser();
  }
}
