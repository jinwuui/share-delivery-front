import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_setting_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class AppSettingApiClient {
  factory AppSettingApiClient(Dio dio, {String baseUrl}) = _AppSettingApiClient;

  // 회원 탈퇴
  @DELETE('/api/accounts')
  Future<void> withdrawUser();
}
