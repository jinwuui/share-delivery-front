import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/login/login_controller.dart';
import 'package:share_delivery/src/ui/login/phone_number_text_field.dart';

class PhoneNumberAuthentication extends GetView<LoginController> {
  const PhoneNumberAuthentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            shape: const Border(
              bottom: BorderSide(color: Colors.black12, width: 1),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Get.back(),
            ),
            title:
                const Text("휴대폰 번호 인증", style: TextStyle(color: Colors.black)),
          ),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.lock_outlined, size: 100),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "휴대폰 가입으로 이용해주세요.\n번호는 물론 안전하게 보관 됩니다.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PhoneNumberTextField(),
                ElevatedButton(
                  // TODO : 휴대폰 번호 입력이 거의 다 되면 (길이로 체크?) 버튼 on 하기
                  child: const Text("인증문자 받기"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    textStyle: const TextStyle(fontSize: 20),
                    elevation: 0,
                    fixedSize: Size(Get.width * 0.9, Get.height * 0.06),
                  ),
                  onPressed: controller.isButtonEnabled.value
                      ? () {
                          controller.login("testid", "testpw");
                        }
                      : null,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "이미 계정이 있나요? ",
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text("추가 예정입니다."),
                              actions: [
                                TextButton(
                                  child: const Text("닫기"),
                                  onPressed: () => Get.back(),
                                )
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          "이메일로 계정 찾기",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
