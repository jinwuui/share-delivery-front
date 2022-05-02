import 'package:share_delivery/src/data/model/user/user.dart';
import 'package:share_delivery/src/data/provider/authentication/authentication_api_client.dart';
import 'package:share_delivery/src/data/provider/authentication/authentication_local_client.dart';

class AuthenticationRepository {
  final AuthenticationApiClient apiClient;
  final AuthenticationLocalClient localClient;

  AuthenticationRepository(
      {required this.apiClient, required this.localClient});

  Future<String> requestAuthSMS(String phoneNumber) {
    return apiClient.requestAuthSMS(phoneNumber);
  }

  Future<User> signUp(String phoneNumber, String authNumber) {
    return apiClient.signUp(phoneNumber, authNumber);
  }

  Future<bool> signIn(String phoneNumber, String authNumber) async {
    try {
      Map<String, String> tokens =
          await apiClient.verifyAuthNumber(phoneNumber, authNumber);
      localClient.saveTokens(tokens);
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }

  signOut() {}

  getCurrentUser() {
    // TODO : 로컬에 저장된 현재 유저 조회할 것
    return User(
        accountId: -1, status: '', phoneNumber: '', nickname: '', role: '');
  }
}
