import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:share_delivery/src/controller/community/community_controller.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/repository/community/post_register/post_register_repository.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class PostRegisterController extends GetxController {
  PostRegisterRepository repository;

  PostRegisterController(
      {this.isRegisterPost = true, required this.repository});

  // 카테고리
  static const String initCategoryMsg = "글의 주제를 선택해주세요!";
  RxString category = initCategoryMsg.obs;

  // 글 내용
  Rx<TextEditingController> content = TextEditingController().obs;

  // 첨부 이미지
  var images = <String>[].obs;

  // UI 관련
  RxBool isContentEmpty = true.obs;
  String appBarTitle = "생활 공유";
  bool isRegisterPost;

  @override
  onInit() {
    super.onInit();

    // 게시글 수정 모드
    if (!isRegisterPost) {
      appBarTitle = "글 수정하기";
    }
  }

  void setPostTopic(String category) {
    this.category.value = category;
  }

  void setIsContentEmpty(String text) {
    isContentEmpty.value = text.trim().isEmpty;
  }

  // 사진 선택
  Future<void> pickImage() async {
    if (images.length >= 10) {
      GetSnackbar.on("알림", "사진은 최대 10개까지 첨부할 수 있습니다!");
      return;
    }

    List<Media>? res = await ImagesPicker.pick(
      count: 10 - images.length,
      pickType: PickType.image,
    );

    if (res != null) {
      for (Media media in res) {
        images.add(media.path);
      }
    }
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
      images,
    );

    if (post == null) {
      GetSnackbar.err("오류", "다시 시도해주세요!");
    } else {
      CommunityController.to.addPost(post);
      Get.until((route) => Get.currentRoute == Routes.INITIAL);
      Get.toNamed(Routes.POST_DETAIL, arguments: {"post": post});
    }
  }

  void deleteImage(String targetImageURL) {
    images.remove(targetImageURL);
  }
}
