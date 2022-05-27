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

  Future<User> signUp(String phoneNumber, String authNumber) {
    return apiClient.signUp(phoneNumber, authNumber);
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

  signOut() {}

  User? getSavedUser() {
    return localClient.getSavedUser();
  }

  Future<void> refreshToken() async {
    // ApiClient 에서 API 요청 시에, 토큰이 만료되면 실행
    // 1. 로컬에서 토큰 들고오기
    Map<String, String> tokens = localClient.findTokens();

    // 2. 토큰 받아오기
    Map<String, String> newTokens = await apiClient.refreshToken(tokens);

    // 3. 받아온 토큰을 로컬에 저장하기
    localClient.saveTokens(newTokens);
  }
}
