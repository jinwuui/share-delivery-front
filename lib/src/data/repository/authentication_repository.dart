import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/provider/authentication/authentication_api_client.dart';
import 'package:share_delivery/src/data/provider/authentication/authentication_local_client.dart';

class AuthenticationRepository {
  final AuthenticationApiClient apiClient;
  final AuthenticationLocalClient localClient;

  AuthenticationRepository(
      {required this.apiClient, required this.localClient});

  Future<Map<String, dynamic>> requestAuthSMS(String phoneNumber) {
    return apiClient.requestAuthSMS(phoneNumber);
  }

  Future<User?> signUp(String phoneNumber, String authNumber) async {
    User user = await apiClient.signUp(phoneNumber, authNumber);

    if (user.accountId == -1) {
      print("   회원가입 실패");
      return null;
    } else {
      print("   회원가입 성공");
      localClient.saveUser(user);
      return user;
    }
  }

  Future<bool> signIn(String phoneNumber, String authNumber) async {
    try {
      Map<String, dynamic> tokens =
          await apiClient.verifyAuthNumber(phoneNumber, authNumber);

      if (tokens["accessToken"] != null) {
        localClient.saveTokens(tokens);
      } else {
        throw Exception();
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  // 로그아웃
  signOut() {}

  // 로컬에 저장된 유저 객체 가져오기
  User? getSavedUser() {
    return localClient.getSavedUser();
  }
}
