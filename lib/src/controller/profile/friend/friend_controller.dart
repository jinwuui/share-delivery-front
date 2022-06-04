import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/repository/profile/friend_res_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class FriendController extends GetxController
    with StateMixin<List<FriendResDTO>> {
  final ProfileRepository repository;

  static FriendController get to => Get.find();
  FriendController({required this.repository});

  final TextEditingController searchController = TextEditingController();

  final friends = <FriendResDTO>[].obs;

  @override
  void onReady() async {
    super.onReady();
    await getFriendList();
  }

  void filterFriends(String searchTerm) {
    List<FriendResDTO> results = [];

    if (searchTerm.isEmpty) {
      results = friends;
    } else {
      results = friends
          .where(
            (element) => element.nickname
                .toString()
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          )
          .toList();
    }
    change(results, status: RxStatus.success());
  }

  Future<void> getFriendList() async {
    try {
      change(null, status: RxStatus.loading());

      String fiendType = "ACCEPTED";

      List<FriendResDTO> list = await repository.getFriendList(fiendType);
      friends.value = list;

      change(friends, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> deleteFriend(int accountId) async {
    try {
      change(null, status: RxStatus.loading());

      String res = await repository.deleteFriend(accountId);
      if (int.parse(res) == accountId) {
        friends.value =
            friends.where((el) => el.accountId != accountId).toList();
        Get.snackbar("삭제 성공", "친구가 삭제되었습니다.",
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            duration: Duration(seconds: 1));
      } else {
        Get.snackbar("삭제 실패", "친구 삭제에 실패하였습니다.",
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            duration: Duration(seconds: 1));
      }

      change(friends, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }
}
