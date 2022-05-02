import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class AuthenticationLocalClient {
  void saveTokens(Map<String, String> tokens) {
    if (tokens["accessToken"] != null && tokens["refreshToken"] != null) {
      SharedPrefsUtil.instance
          .setString("accessToken", tokens["accessToken"] ?? "");
      SharedPrefsUtil.instance
          .setString("refreshToken", tokens["refreshToken"] ?? "");
    }
  }
}
