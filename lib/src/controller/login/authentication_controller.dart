import 'package:get/get.dart';
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
  void onInit() {
    _getAuthenticatedUser();
    SmsAutoFill().listenForCode;
    super.onInit();
  }

  @override
  void onClose() {
    SmsAutoFill().unregisterListener();
    super.onClose();
  }

  Future<String?> requestAuthSMS(String phoneNumber) async {
    return repository.requestAuthSMS(phoneNumber);
  }

  Future<bool> signUp(String phoneNumber, String authNumber) async {
    return await repository.signUp(phoneNumber, authNumber);
  }

  Future<void> login(String phoneNumber, String verificationCode) async {
    User? user = await repository.login(phoneNumber, verificationCode);

    if (user != null) {
      _authenticationStateStream.value = Authenticated(user: user);
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
    print("checkecheoicjoeij $user");
    // _authenticationStateStream.value = Authenticated(
    //     user: User(
    //         accountId: 1, phoneNumber: "", nickname: "", status: "", role: ''));
    // return;

    if (user == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(user: user);
    }
  }
}
