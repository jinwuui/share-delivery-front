import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/profile/account/account_controller.dart';
import 'package:share_delivery/src/ui/widgets/profile_textform.dart';
import 'package:share_delivery/src/ui/theme/profile_theme.dart';

class ModifyProfile extends StatelessWidget {
  ModifyProfile({Key? key}) : super(key: key);

  final modifyProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AccountController controller = AccountController.to;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
              if (modifyProfileFormKey.currentState!.validate()) {
                try {
                  await AccountController.to.updateAccountInfo();
                } catch (e) {
                  Logger().w(e);
                }
                // validation 이 성공하면 true 가 리턴
                Get.snackbar(
                  '저장완료',
                  '프로필 정보가 변경되었습니다.',
                  backgroundColor: Colors.white,
                );
              }
            },
            child: Text(
              "완료",
              style: TextStyle(
                // color: Colors.black,
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
                                ? NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/01/20/13/05/cat-1151519__480.jpg")
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
                                    await AccountController.to.pickImage();
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
                            onSaved: (newValue) {},
                            validator: (value) {
                              if (value.length < 1) {
                                return '닉네임은 필수사항입니다.';
                              }
                              if (value.length > 10) {
                                return '닉네임은 10자 이하로 입력해주세요.';
                              }
                              return null;
                            },
                            initialValue: '닉네임 닉네임',
                          ),
                          ProfileTextFormField(
                            label: "이메일",
                            onSaved: (newValue) {},
                            validator: (value) {
                              if (value.length < 1) {
                                return '이메일은 필수사항입니다.';
                              }

                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                                return '잘못된 이메일 형식입니다.';
                              }

                              return null;
                            },
                            initialValue: "vxc7099@gmail.com",
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
