import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:share_delivery/src/controller/notification_controller/notification_controller.dart';
import 'package:share_delivery/src/data/model/user/user.dart';

class AuthenticationApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  /// @description 인증 SMS 발송 요청
  /// @param phoneNumber: 사용자 휴대폰 번호
  Future<String> requestAuthSMS(String phoneNumber) async {
    phoneNumber = phoneNumber.replaceAll(" ", "");

    try {
      print("-- 인증 SMS 발송 요청");

      final uri =
          Uri.parse('$host/api/auth/verification-sms?phoneNumber=$phoneNumber');
      final response = await http.get(uri);

      print("-=-=-=-=-=-=-=- ${response.body}");

      if (response.statusCode == 202) {
        return response.body;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return "ERROR";
    }
  }

  /// @description 회원가입 (인증번호 검증)
  /// @param phoneNumber: 사용자 휴대폰 번호, authNumber: 인증번호
  Future<User> signUp(String phoneNumber, String authNumber) async {
    User result = User(
        accountId: -1, status: '', phoneNumber: '', nickname: '', role: '');

    try {
      // TODO : 폰 번호와 인증 번호로 회원가입 하기
      print("-- 회원가입: 폰 번호와 인증 번호로 토큰 받아오기");
      Uri url = Uri.parse("$host/api/accounts");
      final Response response = await http.post(url, body: {
        "phoneNumber": phoneNumber,
        "authNumber": authNumber,
      });

      if (response.statusCode == 201) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        result = User.fromJson(userMap);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    return result;
  }

  /// @description 로그인 (인증번호 검증)
  /// @param phoneNumber: 사용자 휴대폰 번호, authNumber: 인증번호
  Future<Map<String, String>> verifyAuthNumber(
      String phoneNumber, String authNumber) async {
    Map<String, String> tokens = {};

    try {
      // TODO : 폰 번호와 인증 번호로 토큰 받아오기
      print("-- 로그인: 폰 번호와 인증 번호로 토큰 받아오기");
      print("fcmToken: ${NotificationController().fcmToken}");

      Uri url = Uri.parse("$host/api/auth/login");
      final Response response = await http.post(url, body: {
        "phoneNumber": phoneNumber,
        "authNumber": authNumber,
        "fcmToken": "dummy token",
      });

      if (response.statusCode == 200) {
        tokens = jsonDecode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    return tokens;
  }

  Future<Map<String, String>> refreshToken(
      Map<String, String> oldTokens) async {
    Map<String, String> tokens = {};

    try {
      // TODO : 만료된 access token, refresh token 으로 갱신 요청
      print("-- access 토큰 갱신 : 만료된 토큰과 refresh 토큰으로 access 토큰 갱신 요청");

      Uri url = Uri.parse("$host/api/auth/refreshed-token");
      final Response response = await http.post(url, body: {
        "expiredAccessToken": oldTokens["accessToken"],
        "refreshToken": oldTokens["refreshToken"],
      });

      if (response.statusCode == 200) {
        tokens = jsonDecode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    return tokens;
  }
}
