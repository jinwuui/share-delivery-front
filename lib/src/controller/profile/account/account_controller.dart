import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/repository/profile/account_update_req_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';

class AccountController extends GetxController {
  final ProfileRepository repository;

  static AccountController get to => Get.find();
  AccountController({required this.repository});

  final isLoad = false.obs;
  final profileImagePath = "".obs;

  @override
  void onInit() {
    // fetchAccountBank();
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image == null) throw Error();

      profileImagePath.value = image.path;
    } catch (e) {
      Logger().w(e);
    }
  }

  Future<void> updateAccountInfo() async {
    AccountUpdateReqDTO dto =
        AccountUpdateReqDTO(userId: 1, email: "vxc79", nickname: "hello world");
    File profileImage = File(profileImagePath.value);
    try {
      await repository.updateUserInfo(dto, profileImage);
    } catch (e) {
      Logger().w(e);
    }
  }
}
