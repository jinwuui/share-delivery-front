import 'dart:io';

import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/profile/profile.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';
import 'package:share_delivery/src/data/repository/profile/account_update_req_dto.dart';

class ProfileRepository {
  final ProfileApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<List<User>> getFriendList() async {
    return apiClient.getFriendList();
  }

  Future<void> updateAccountBank(AccountBankDTO accountDTO) async {
    return await apiClient.registerAccount(accountDTO);
  }

  Future<AccountBankDTO> fetchAccountBank() async {
    return await apiClient.readAccount();
  }

  Future<ProfileModel> fetchUserInfo(int accountId) async {
    Logger().w(accountId);
    return await apiClient.readUser(accountId);
  }

  Future<User> updateUserInfo(
      AccountUpdateReqDTO accountUpdateReqDTO, File? profileImage) async {
    return await apiClient.updateUser(
        accountDetail: accountUpdateReqDTO, profileImage: profileImage);
  }

  Future deleteAccount() async {
    return await apiClient.deleteAccount();
  }

  Future<bool> checkNickName(String nickName) async {
    return await apiClient.checkNickName(nickName);
  }
}
