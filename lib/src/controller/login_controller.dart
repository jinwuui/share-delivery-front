import 'package:get/get.dart';
import 'package:share_delivery/src/controller/authentication_controller.dart';
import 'package:share_delivery/src/utils/login/login_state.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  // 사용자가 작성한 이메일 패스워드로 로그인 시도
  // TODO : 우린 전화번호로 변경해야함
  void login(String email, String password) async {
    print("로그인 시도");
    _loginStateStream.value = LoginLoading();

    // AuthenticationController 에서 로그인을 시도하고 login 성공/실패로 갈림
    try {
      await _authenticationController.signIn(email, password);
      _loginStateStream.value = LoginState();
    } catch (e) {
      _loginStateStream.value = LoginFailure(error: e.toString());
    }
  }
}
