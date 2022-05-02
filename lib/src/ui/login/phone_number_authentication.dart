import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_delivery/src/controller/login/login_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/login/phone_number_text_field.dart';
import 'package:share_delivery/src/ui/login/state/login_state.dart';

class PhoneNumberAuthentication extends GetView<LoginController> {
  const PhoneNumberAuthentication({Key? key}) : super(key: key);

  Future<void> authenticate() async {
    // TODO : login 구현 끝나면 삭제할 것
    await Future.delayed(Duration(milliseconds: 500));

    if (controller.isNewUser) {
      await controller.signUp();
    } else {
      await controller.login();
    }

    // 로그인 결과
    Type loginStatus = controller.state.runtimeType;

    if (loginStatus == LoginFailure) {
      Get.snackbar(
        "인증 실패!",
        "다시 시도해주세요.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print(controller.state.props);
    } else if (loginStatus == LoginSuccess) {
      print("Login Success");
      Get.offAllNamed(Routes.INITIAL);
    }
  }

  void requestAuthSMS() {
    if (controller.isEnabledSendRequest.value) {
      controller.setIsEnabledSendRequest(false);
      Get.snackbar(
        "요청 완료",
        "인증번호가 문자로 전송됐습니다.",
        backgroundColor: Colors.black,
        colorText: Colors.white,
        duration: Duration(milliseconds: 1000),
      );
      controller.requestAuthSMS();
      controller.scrollController.value.animateTo(
        Get.height * 0.22,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      Timer(Duration(seconds: 10), () {
        try {
          controller.setIsEnabledSendRequest(true);
        } catch (e) {
          print("NOT FOUND CONTROLLER");
        }
      });
    } else {
      Get.snackbar(
        "요청 실패",
        "10초 이내에는 인증번호를 요청할 수 없습니다.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1000),
      );
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: LoaderOverlay(
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
              title: const Text("휴대폰 번호 인증",
                  style: TextStyle(color: Colors.black)),
            ),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                controller: controller.scrollController.value,
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
                      child: Text(
                        controller.onTextFieldSMS.value
                            ? "인증문자 다시 받기 (04분 53초)"
                            : "인증문자 받기",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        textStyle: const TextStyle(fontSize: 20),
                        elevation: 0,
                        fixedSize: Size(Get.width * 0.9, Get.height * 0.06),
                      ),
                      // TODO : 키보드 내릴 것
                      onPressed: controller.isEnabledRequestSMSButton.value
                          ? () => requestAuthSMS()
                          : null,
                    ),
                    controller.onTextFieldSMS.value
                        ? authInputForm(context)
                        : findAccountUsingEmail(),
                    SizedBox(height: Get.height < 700 ? 400 : 500),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget authInputForm(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          width: Get.width * 0.9,
          height: Get.height * 0.07,
          child: TextField(
            maxLength: 6,
            keyboardType: TextInputType.number,
            onChanged: (text) {
              if (text.isNotEmpty) {
                controller.setIsEnabledVerifyButton(true);
                controller.setAuthNumber(text);
              } else {
                controller.setIsEnabledVerifyButton(false);
              }
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.0),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              hintText: "인증번호 입력",
              counterText: "",
            ),
          ),
        ),
        ElevatedButton(
          // TODO : 휴대폰 번호 입력이 거의 다 되면 (길이로 체크?) 버튼 on 하기
          child: Text(
            "인증번호 확인",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            textStyle: const TextStyle(fontSize: 20),
            elevation: 0,
            fixedSize: Size(Get.width * 0.9, Get.height * 0.06),
          ),
          onPressed: controller.isEnabledVerifyButton.value
              ? () async {
                  context.loaderOverlay.show();
                  await authenticate();
                  context.loaderOverlay.hide();
                }
              : null,
        )
      ],
    );
  }

  Widget findAccountUsingEmail() {
    return Container(
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
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
