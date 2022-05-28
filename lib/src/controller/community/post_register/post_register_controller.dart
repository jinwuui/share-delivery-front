import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/repository/community/post_register/post_register_repository.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class PostRegisterController extends GetxController {
  PostRegisterRepository repository;

  PostRegisterController({required this.repository});

  static const String initCategoryMsg = "글의 주제를 선택해주세요!";
  RxString category = initCategoryMsg.obs;
  Rx<TextEditingController> content = TextEditingController().obs;
  RxBool isContentEmpty = true.obs;

  void setPostTopic(String category) {
    this.category.value = category;
  }

  void setIsContentEmpty(String text) {
    isContentEmpty.value = text.trim().isEmpty;
  }

  // 게시글 등록
  Future<void> registerPost() async {
    if (content.value.text.trim().isEmpty) {
      GetSnackbar.on("알림", "내용을 채워주세요.");
      return;
    }

    if (category.value.isEmpty || category.value == initCategoryMsg) {
      GetSnackbar.on("알림", "주제를 선택해주세요.");
      return;
    }

    UserLocation? userLocation = repository.getUserLocation();
    if (userLocation == null) {
      GetSnackbar.on("알림", "위치 설정을 먼저 해주세요!");
      return;
    }

    Post? post = await repository.registerPost(
      userLocation,
      content.value.text,
      category.value,
    );

    if (post == null) {
      GetSnackbar.err("오류", "다시 시도해주세요!");
    } else {
      // TODO: 게시글 상세조회 페이지로 이동 - 테스트 필요
      Get.toNamed(Routes.POST_DETAIL, arguments: {"postId": post.postId});
    }
  }
}
