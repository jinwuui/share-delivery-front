import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/user/user.dart';
import 'package:share_delivery/src/data/repository/authentication_repository.dart';
import 'package:share_delivery/src/ui/login/state/authentication_state.dart';

class AuthenticationController extends GetxController {
  final AuthenticationRepository repository;
  final _authenticationStateStream = const AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController({required this.repository});

  // 컨트롤러가 메모리에 할당된 후에 즉시 실행
  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<String> requestAuthSMS(String phoneNumber) {
    return repository.requestAuthSMS(phoneNumber);
  }

  Future<User> signUp(String phoneNumber, String authNumber) async {
    User user = await repository.signUp(phoneNumber, authNumber);
    _authenticationStateStream.value = Authenticated(user: user);
    return user;
  }

  Future<void> signIn(String phoneNumber, String authNumber) async {
    print("sign In : $phoneNumber, $authNumber");

    bool result = await repository.signIn(phoneNumber, authNumber);
    if (result) {
      // TODO : 로그인 성공/실패 로직 처리
    }
  }

  void signOut() async {
    await repository.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final User? user = await repository.getCurrentUser(); // 홈 화면으로
    // User? user; // 로그인 화면으로

    if (user == null) {
      print("user == null");
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      print("user != null");
      _authenticationStateStream.value = Authenticated(user: user);
    }
  }
}
