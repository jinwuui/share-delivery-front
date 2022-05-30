import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';
import 'package:share_delivery/src/data/repository/profile/account_bank_dto.dart';

class ProfileRepository {
  final ProfileApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<List<User>> getFriendList() async {
    List<User> list = [
      User(
        accountId: 1,
        phoneNumber: "0104111111",
        nickname: "parkjinwoo",
        status: "asdasd",
        profileImage:
            "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
        role: '',
      ),
      User(
        accountId: 2,
        phoneNumber: "0104111111",
        nickname: "woowoowoo",
        status: "asdasd",
        profileImage:
            "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
        role: '',
      ),
      User(
        accountId: 3,
        phoneNumber: "0104111111",
        nickname: "jinjinjin",
        status: "asdasd",
        profileImage:
            "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
        role: '',
      ),
    ];

    await 2.delay();

    return list;
    return apiClient.getFriendList();
  }

  Future<void> updateAccountBank(AccountBankDTO accountDTO) async {
    return await apiClient.registerAccount(accountDTO);
  }

  Future<AccountBankDTO> fetchAccountBank() async {
    await 1.delay();
    return AccountBankDTO(
        userId: 1,
        bank: "농협",
        accountNumber: "3521264915483",
        accountHolder: "박진우");
    return await apiClient.readAccount();
  }

  Future<User> fetchUserInfo(int accountId) async {
    await 1.delay();
    return User(
        accountId: 1,
        phoneNumber: '',
        nickname: 'nickname',
        status: 'status',
        role: 'role');
    return await apiClient.readUser(accountId);
  }

  Future<User> updateUserInfo(
      AccountUpdateReqDTO accountUpdateReqDTO, File profileImage) async {
    return await apiClient.updateUser(accountUpdateReqDTO, profileImage);
  }
}
