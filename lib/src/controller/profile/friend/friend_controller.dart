import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/ui/profile/friend/friend.dart';

class FriendController extends GetxController with StateMixin<List<User>> {
  final ProfileRepository repository;

  static FriendController get to => Get.find();
  FriendController({required this.repository});

  final TextEditingController searchController = TextEditingController();

  final friends = <User>[].obs;

  @override
  void onReady() async {
    super.onReady();
    try {
      change(null, status: RxStatus.loading());

      friends.value = await getFriendList();

      change(friends, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
    }
  }

  void filterFriends(String searchTerm) {
    List<User> results = [];

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

  Future<List<User>> getFriendList() async {
    return await repository.getFriendList();
  }
}
