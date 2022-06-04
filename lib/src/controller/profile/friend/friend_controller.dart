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
      Logger().i("hello");

      List<FriendResDTO> list = await repository.getFriendList(fiendType);
      Logger().i(list);
      friends.value = list;

      change(friends, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }
}
