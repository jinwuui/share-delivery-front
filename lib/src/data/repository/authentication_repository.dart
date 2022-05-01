import 'package:share_delivery/src/data/model/user.dart';
import 'package:share_delivery/src/data/provider/authentication_api_client.dart';

class AuthenticationRepository {
  final AuthenticationApiClient apiClient;

  AuthenticationRepository({required this.apiClient});

  Future<String> requestAuthSMS(String phoneNumber) {
    return apiClient.requestAuthSMS(phoneNumber);
  }

  User signInWithPhoneNumberAndAuthNumber(
      bool isNewUser, String phoneNumber, String authNumber) {
    if (isNewUser) {
      return User(phoneNumber: "010 1234 5678");
      return apiClient.signUp(phoneNumber, authNumber);
    } else {
      return User(phoneNumber: "010 1234 5678");
      return apiClient.verifyAuthNumber(phoneNumber, authNumber);
    }
  }

  signOut() {}

  getCurrentUser() {
    // TODO : 로컬에 저장된 현재 유저 조회할 것
    return User(phoneNumber: '1234');
  }
}
