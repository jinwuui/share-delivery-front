import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/ui/login/state/login_state.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  String phoneNumber = "";
  String authNumber = "";
  RxBool isEnabledSendRequest = true.obs;
  RxBool isEnabledRequestSMSButton = false.obs;
  RxBool isEnabledVerifyButton = false.obs;
  RxBool onTextFieldSMS = false.obs;
  bool isNewUser = false;

  Rx<ScrollController> scrollController = ScrollController().obs;

  void requestAuthSMS() async {
    String result = await _authenticationController.requestAuthSMS(phoneNumber);
    if (result == "ERROR") {
      // TODO : "다시 발송 요청 해주십쇼" 메시지 화면에 출력
      print("ERROR");
    } else {
      // TODO : 인증 번호 작성을 위한 폼펙터로 변경
      onTextFieldSMS.value = true;

      if (result == "NEW") {
        isNewUser = true;
      } else if (result == "EXIST") {
        isNewUser = false;
      }
    }
  }

  // 사용자가 작성한 이메일 패스워드로 로그인 시도
  Future<void> login() async {
    _loginStateStream.value = LoginLoading();

    // AuthenticationController 에서 로그인을 시도하고 login 성공/실패로 갈림
    try {
      await _authenticationController.signIn(
          isNewUser, phoneNumber, authNumber);

      _loginStateStream.value = LoginSuccess();
    } catch (e) {
      _loginStateStream.value = LoginFailure(error: e.toString());
    }
  }

  void setIsEnabledSendRequest(bool value) {
    isEnabledSendRequest.value = value;
  }

  void setIsEnabledRequestSMSButton(bool value) {
    isEnabledRequestSMSButton.value = value;
  }

  void setIsEnabledVerifyButton(bool value) {
    isEnabledVerifyButton.value = value;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setAuthNumber(String authNumber) {
    this.authNumber = authNumber;
  }
}
