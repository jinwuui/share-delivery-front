import 'dart:convert';

import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class AuthenticationLocalClient {
  void saveTokens(String accessToken, String refreshToken) {
    SharedPrefsUtil.instance.setString("accessToken", accessToken);
    SharedPrefsUtil.instance.setString("refreshToken", refreshToken);
  }

  Map<String, String> findTokens() {
    Map<String, String> tokens = {};

    tokens["accessToken"] = SharedPrefsUtil.instance.getString("accessToken")!;
    tokens["refreshToken"] =
        SharedPrefsUtil.instance.getString("refreshToken")!;

    return tokens;
  }

  void saveUser(User user) {
    Map<String, dynamic> userMap = user.toJson();
    String userString = jsonEncode(userMap);

    print('start - AuthenticationLocalClient.saveUser');
    print(userMap);
    print(userString);
    print('end  -  AuthenticationLocalClient.saveUser');

    SharedPrefsUtil.instance.setString("user", userString);
  }

  // 로그아웃을 위해 유저의 로컬 정보 삭제
  void deleteUser() {
    // SharedPrefsUtil.instance.remove("user");
    // SharedPrefsUtil.instance.remove("accessToken");
    // SharedPrefsUtil.instance.remove("refreshToken");
    // SharedPrefsUtil.instance.remove("receivingLocations");
    // SharedPrefsUtil.instance.remove("userLocation");
    SharedPrefsUtil.instance.clear();
  }

  User? getSavedUser() {
    try {
      String? userStr = SharedPrefsUtil.instance.getString("user");

      if (userStr == null) {
        print("자동 로그인 실패 - 유저 정보 없음");
      } else {
        print("자동 로그인 성공 - 유저 정보 있음");
      }

      Map<String, dynamic> userMap = jsonDecode(userStr!);
      return User.fromJson(userMap);
    } catch (e) {
      print(e);
      print("자동 로그인 실패 - 유저가 정보가 없음");
    }
    return null;
  }
}
