import 'dart:convert';

import 'package:share_delivery/src/data/model/user/user.dart';
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

  User? getSavedUser() {
    try {
      String? userStr = SharedPrefsUtil.instance.getString('user');

      Map<String, dynamic> userMap = jsonDecode(userStr!);
      return User.fromJson(userMap);
    } catch (e) {
      print("자동 로그인 실패 - 유저가 정보가 없음");
    }
    return null;
  }
}
