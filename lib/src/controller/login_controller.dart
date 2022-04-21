import 'package:get/get.dart';
import 'package:share_delivery/src/controller/authentication_controller.dart';
import 'package:share_delivery/src/utils/login/login_state.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authenticationController.signIn(email, password);
      _loginStateStream.value = LoginState();
    } catch (e) {
      _loginStateStream.value = LoginFailure(error: e.toString());
    }
  }
}
