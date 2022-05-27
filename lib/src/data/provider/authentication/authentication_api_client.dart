import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/utils/http_env.dart';

class AuthenticationApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  /// @description 인증 SMS 발송 요청
  /// @param phoneNumber: 사용자 휴대폰 번호
  Future<Map<String, dynamic>> requestAuthSMS(String phoneNumber) async {
    print('AuthenticationApiClient.requestAuthSMS $phoneNumber');

    try {
      print("-- 인증 SMS 발송 요청");

      final uri =
          Uri.parse('$host/api/auth/verification-sms?phoneNumber=$phoneNumber');
      final response = await http.get(uri);

      if (response.statusCode == 202) {
        print("  statusCode: 202 ${response.body}");

        return jsonDecode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return {"verificationType": "ERROR"};
    }
  }

  /// @description 회원가입 (인증번호 검증)
  /// @param phoneNumber: 사용자 휴대폰 번호, authNumber: 인증번호
  Future<User> signUp(String phoneNumber, String authNumber) async {
    User result =
        User(accountId: -1, status: '', phoneNumber: '', nickname: '');

    try {
      // TODO : 폰 번호와 인증 번호로 회원가입 하기
      print("-- 회원가입: 폰 번호와 인증 번호로 토큰 받아오기");
      Uri url = Uri.parse("$host/api/accounts");
      String body = jsonEncode({
        "phoneNumber": phoneNumber,
        "verificationCode": authNumber,
      });
      print(body);
      final Response response = await http.post(
        url,
        headers: HttpEnv.contentType,
        body: body,
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        result = User.fromJson(userMap);
        print('- signUp $result');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    print('AuthenticationApiClient.signUp : $result');
    return result;
  }

  /// @description 로그인 (인증번호 검증)
  /// @param phoneNumber: 사용자 휴대폰 번호, authNumber: 인증번호
  Future<Map<String, dynamic>> verifyAuthNumber(
      String phoneNumber, String authNumber) async {
    Map<String, dynamic> tokens = {};

    try {
      // TODO : 폰 번호와 인증 번호로 토큰 받아오기
      print("-- 로그인: 폰 번호와 인증 번호로 토큰 받아오기");
      // print("fcmToken: ${NotificationController().fcmToken}");

      Uri url = Uri.parse("$host/api/auth/login");
      String body = jsonEncode({
        "phoneNumber": phoneNumber,
        "verificationCode": authNumber,
        "fcmToken": "dummytoken",
      });

      print('AuthenticationApiClient.verifyAuthNumber \nbody : $body');
      final Response response = await http.post(
        url,
        headers: HttpEnv.contentType,
        body: body,
      );

      print("   res: ${response.statusCode}, ${response.body}");
      if (response.statusCode == 200) {
        tokens = jsonDecode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    print("   tokens: $tokens");
    return tokens;
  }
}
