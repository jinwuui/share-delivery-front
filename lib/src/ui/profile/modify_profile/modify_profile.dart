import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/controller/profile/account/modify_account_controller.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/ui/widgets/profile_textform.dart';
import 'package:share_delivery/src/utils/image_util.dart';

class ModifyProfile extends GetView<ModifyAccountController> {
  ModifyProfile({Key? key}) : super(key: key);

  final modifyProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "프로필 수정",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        elevation: 0.0,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
              elevation: 0.0,
            ),
            onPressed: () async {
              if (controller.checkNickname.value) {
                Get.snackbar(
                  "알림",
                  "닉네임 중복 확인을 해주세요",
                  icon: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                );
                return;
              }

              if (modifyProfileFormKey.currentState!.validate() &&
                  controller.checkNickname.value == false) {
                try {
                  await ModifyAccountController.to.updateAccountInfo();

                  Get.back();

                  Get.snackbar(
                    '저장완료',
                    '프로필 정보가 변경되었습니다.',
                    backgroundColor: Colors.white,
                  );
                } catch (e) {
                  Logger().w(e);
                }
              }
            },
            child: Text(
              "완료",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: CircleAvatar(
                        radius: 82,
                        backgroundColor: Colors.grey.shade300,
                        child: Obx(
                          () => CircleAvatar(
                            radius: 80,
                            backgroundImage: controller
                                        .profileImagePath.value ==
                                    ""
                                ? (AuthenticationController.to.state.props.first
                                                as User)
                                            .profileImageUrl ==
                                        ''
                                    ? randomProfileImage()
                                    : customNetworkImage(
                                        (AuthenticationController
                                                .to.state.props.first as User)
                                            .profileImageUrl)
                                : FileImage(
                                        File(controller.profileImagePath.value))
                                    as ImageProvider,
                            backgroundColor: Colors.grey.shade300,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 28.0,
                                child: InkWell(
                                  onTap: () async {
                                    await ModifyAccountController.to
                                        .pickImage();
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 40.0,
                                    color: Color(0xFF404040),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: modifyProfileFormKey,
                      child: Column(
                        children: [
                          ProfileTextFormField(
                            label: "닉네임",
                            onSaved: (newValue) {
                              controller.nickname.value = newValue;
                            },
                            onChanged: (newValue) {
                              controller.nickname.value = newValue;
                            },
                            validator: (value) {
                              if (value.length < 1) {
                                return '닉네임은 필수사항입니다.';
                              }
                              if (value.length > 15) {
                                return '닉네임은 15자 이하로 입력해주세요.';
                              }
                              return null;
                            },
                            initialValue: controller.nickname.value,
                            button: TextButton(
                              onPressed: () async {
                                await controller.checkNickName();

                                if (controller.checkNickname.value) {
                                  Get.snackbar(
                                    "알림",
                                    "중복된 닉네임입니다.",
                                    icon: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black,
                                  );
                                } else {
                                  Get.snackbar(
                                    "알림",
                                    "사용 가능한 닉네임입니다.",
                                    icon: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black,
                                  );
                                }
                              },
                              child: Text(
                                "중복 확인",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          ProfileTextFormField(
                            label: "이메일",
                            onSaved: (newValue) {
                              controller.email.value = newValue;
                            },
                            onChanged: (newValue) {
                              controller.email.value = newValue;
                            },
                            validator: (value) {
                              if (value.length < 1) {
                                return null;
                              }

                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return '잘못된 이메일 형식입니다.';
                              }

                              return null;
                            },
                            initialValue: controller.email.value ?? ' ',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
