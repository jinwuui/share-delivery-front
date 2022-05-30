import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/account_dto.dart';

part 'profile_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String baseUrl}) = _ProfileApiClient;

  @GET('/api/friends')
  Future<List<User>> getFriendList();

  // 계좌 조회
  @GET('/api/accounts/back-account')
  Future<AccountDTO> readAccount();

  // 계좌 등록
  @POST('/api/accounts/back-account')
  Future<void> registerAccount(@Body() AccountDTO accountDTO);

  // 유저 정보 조회
  @GET('/api/users/{accountId}')
  Future<User> readUser(@Path() int accountId);
}
