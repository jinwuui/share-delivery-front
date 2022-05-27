import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/authentication_repository.dart';
import 'package:share_delivery/src/ui/login/state/authentication_state.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthenticationController extends GetxController {
  final AuthenticationRepository repository;
  final _authenticationStateStream = const AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController({required this.repository});

  // 컨트롤러가 메모리에 할당된 후에 즉시 실행
  @override
  void onInit() async {
    await _getAuthenticatedUser();
    SmsAutoFill().listenForCode;
    super.onInit();
  }

  @override
  void onClose() {
    SmsAutoFill().unregisterListener();
    super.onClose();
  }

  Future<Map<String, dynamic>> requestAuthSMS(String phoneNumber) {
    print('AuthenticationController.requestAuthSMS $phoneNumber');
    return repository.requestAuthSMS(phoneNumber);
  }

  Future<void> signUp(String phoneNumber, String authNumber) async {
    print('AuthenticationController.signUp : $phoneNumber, $authNumber');

    User? user = await repository.signUp(phoneNumber, authNumber);

    if (user != null) {
      _authenticationStateStream.value = Authenticated(user: user);
    } else {
      _authenticationStateStream.value =
          AuthenticationFailure(message: "회원 가입 실패");
    }
  }

  Future<void> signIn(String phoneNumber, String authNumber) async {
    print('AuthenticationController.signIn : $phoneNumber, $authNumber');

    bool result = await repository.signIn(phoneNumber, authNumber);

    // TODO : 삭제해야함
    result = true;

    if (result) {
      _authenticationStateStream.value = Authenticated(
        user: User(
          accountId: -1,
          phoneNumber: "phoneNumber",
          nickname: "nickname",
          status: "status",
        ),
      );
      // TODO : 로그인 성공/실패 로직 처리
    } else {
      _authenticationStateStream.value = UnAuthenticated();
    }
  }

  void signOut() async {
    await repository.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  Future<void> _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final User? user = repository.getSavedUser(); // 자동 로그인 -> 홈 화면으로
    _authenticationStateStream.value = Authenticated(
        user: User(accountId: 1, phoneNumber: "", nickname: "", status: ""));
    return;

    if (user == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(user: user);
    }
  }
}
