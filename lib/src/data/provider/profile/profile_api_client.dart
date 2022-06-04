import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share_delivery/src/data/model/profile/profile.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';
import 'package:share_delivery/src/data/repository/profile/account_update_req_dto.dart';

part 'profile_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String baseUrl}) = _ProfileApiClient;

  // 친구 조회
  @GET('/api/friends')
  Future<List<User>> getFriendList();

  // 계좌 조회
  @GET('/api/accounts/back-account')
  Future<AccountBankDTO> readAccount();

  // 계좌 등록
  @POST('/api/accounts/back-account')
  Future<void> registerAccount(@Body() AccountBankDTO accountDTO);

  // 내 계좌 정보 삭제
  @DELETE('/api/accounts/back-account')
  Future deleteAccount();

  // 유저 정보 조회
  @GET('/api/accounts/{accountId}')
  Future<ProfileModel> readUser(@Path() int accountId);

  // 회원정보 수정
  @PATCH('/api/accounts')
  @MultiPart()
  Future<User> updateUser({
    @Part(name: 'accountDetail') required AccountUpdateReqDTO accountDetail,
    @Part() File? profileImage,
  });

  // 닉네임 중복 확인
  @GET('/api/accounts/nick-name-dp-check/{nickName}')
  Future<bool> checkNickName(@Path() String nickName);
}
