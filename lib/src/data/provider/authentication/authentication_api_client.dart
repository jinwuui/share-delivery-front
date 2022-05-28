import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";
import 'package:share_delivery/src/data/model/authentication/login_req_dto.dart';
import 'package:share_delivery/src/data/model/authentication/login_res_dto.dart';
import 'package:share_delivery/src/data/model/authentication/sign_up_req_dto.dart';

part 'authentication_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class AuthenticationApiClient {
  factory AuthenticationApiClient(Dio dio, {String baseUrl}) =
      _AuthenticationApiClient;

  // 인증 SMS 요청
  @GET("/api/auth/verification-sms")
  Future<dynamic> requestAuthSMS(
    @Query("phoneNumber") String phoneNumber,
  );

  // 회원가입
  @POST("/api/accounts")
  Future<dynamic> signUp(
    @Body() SignUpReqDTO signUpReqDTO,
  );

  // 로그인
  @POST("/api/auth/login")
  Future<LoginResDTO> login(
    @Body() LoginReqDTO loginReqDTO,
  );
}
