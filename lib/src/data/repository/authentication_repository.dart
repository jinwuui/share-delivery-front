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
}
