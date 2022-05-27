import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/delivery_room_register/delivery_room_register_api_client.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';

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
      ),
      User(
        accountId: 2,
        phoneNumber: "0104111111",
        nickname: "woowoowoo",
        status: "asdasd",
        profileImage:
            "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
      ),
      User(
        accountId: 3,
        phoneNumber: "0104111111",
        nickname: "jinjinjin",
        status: "asdasd",
        profileImage:
            "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg",
      ),
    ];

    await 2.delay();

    return list;
    return apiClient.getFriendList();
  }
}
