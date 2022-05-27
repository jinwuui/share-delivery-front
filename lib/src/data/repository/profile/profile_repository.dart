import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/delivery_room_register/delivery_room_register_api_client.dart';
import 'package:share_delivery/src/data/provider/profile/profile_api_client.dart';

class ProfileRepository {
  final ProfileApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<List<User>> getFriendList() async {
    return apiClient.getFriendList();
  }
}
