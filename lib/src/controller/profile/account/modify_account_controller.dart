import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/profile/account_update_req_dto.dart';
import 'package:share_delivery/src/data/repository/profile/profile_repository.dart';
import 'package:share_delivery/src/ui/login/state/authentication_state.dart';

class ModifyAccountController extends GetxController {
  final ProfileRepository repository;

  static ModifyAccountController get to => Get.find();
  ModifyAccountController({required this.repository});

  final profileImagePath = "".obs;
  final checkNickname = true.obs; // check 필요, false 시 수정 가능
  final changeNickname = false.obs;
  final nickname =
      (AuthenticationController.to.state.props.first as User).nickname.obs;
  final email =
      (AuthenticationController.to.state.props.first as User).email.obs;

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
        AccountUpdateReqDTO(email: email.value, nickname: nickname.value);
    Logger().w(dto);
    File? profileImage;

    if (profileImagePath.value != "") {
      profileImage = File(profileImagePath.value);
    }
    try {
      User res = await repository.updateUserInfo(dto, profileImage);
      AuthenticationController.to.state = Authenticated(
        user: (AuthenticationController.to.state.props.first as User).copyWith(
          nickname: res.nickname,
          profileImageUrl: res.profileImageUrl,
          email: res.email,
        ),
      );
      Logger().w(AuthenticationController.to.state.props.first as User);
    } catch (e) {
      Logger().w(e);
    }
  }

  Future<void> checkNickName() async {
    bool result = await repository.checkNickName(nickname.value);
    checkNickname.value = result;
  }
}
