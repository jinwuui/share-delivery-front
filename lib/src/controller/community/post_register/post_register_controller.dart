import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/data/repository/community/post_register/post_register_repository.dart';

class PostRegisterController extends GetxController {
  PostRegisterRepository repository;

  PostRegisterController({required this.repository});

  RxString postTopic = "글의 주제를 선택해주세요!".obs;
  Rx<TextEditingController> postContent = TextEditingController().obs;
  RxBool isContentEmpty = true.obs;
  void setPostTopic(String topic) {
    postTopic.value = topic;
  }

  void setIsContentEmpty(String text) {
    isContentEmpty.value = text.trim().isEmpty;
  }

  void registerPost() {
    repository.registerPost(postContent.value.text, postTopic.value);
  }
}
