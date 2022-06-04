import 'dart:io';

import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/profile/profile.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';
import 'package:share_delivery/src/data/repository/profile/account_update_req_dto.dart';
import 'package:share_delivery/src/data/repository/profile/friend_res_dto.dart';

class ProfileRepository {
  final ProfileApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<List<FriendResDTO>> getFriendList(String friendType) async {
    return await apiClient.getFriendList(friendType);
  }

  Future<void> updateAccountBank(AccountBankDTO accountDTO) async {
    return await apiClient.registerAccount(accountDTO);
  }

  Future<AccountBankDTO?> fetchAccountBank() async {
    try {
      AccountBankDTO res = await apiClient.readAccount();
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<ProfileModel> fetchUserInfo(int accountId) async {
    return await apiClient.readUser(accountId);
  }

  Future<User> updateUserInfo(
      AccountUpdateReqDTO accountUpdateReqDTO, File? profileImage) async {
    return await apiClient.updateUser(
        accountDetail: accountUpdateReqDTO, profileImage: profileImage);
  }

  Future deleteAccountBank() async {
    return await apiClient.deleteAccountBank();
  }

  Future<bool> checkNickName(String nickName) async {
    return await apiClient.checkNickName(nickName);
  }

  Future<String> deleteFriend(int accountId) async {
    return await apiClient.deleteFriend(accountId);
  }
}
