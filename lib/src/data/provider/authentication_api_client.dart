import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthenticationApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  /// @description 인증 SMS 발송 요청
  /// @param phoneNumber: 사용자 휴대폰 번호
  Future<String> requestAuthSMS(String phoneNumber) async {
    // return "";
    try {
      // TODO : 인증 SMS 발송 요청하기
      Uri url = Uri.parse("$host/api/auth/verification-sms");
      final Response response =
          await http.post(url, body: {"phoneNumber": phoneNumber});

      if (response.statusCode == 200) {
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
  signUp(String phoneNumber, String authNumber) async {
    // return null;
    try {
      // TODO : 폰 번호와 인증 번호로 토큰 받아오기
      Uri url = Uri.parse("$host/api/auth/users");
      final Response response = await http.post(url, body: {
        "phoneNumber": phoneNumber,
        "authNumber": authNumber,
      });

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  /// @description 로그인 (인증번호 검증)
  /// @param phoneNumber: 사용자 휴대폰 번호, authNumber: 인증번호
  verifyAuthNumber(String phoneNumber, String authNumber) async {
    // return null;
    try {
      // TODO : 폰 번호와 인증 번호로 토큰 받아오기
      Uri url = Uri.parse("$host/api/auth/login");
      final Response response = await http.post(url, body: {
        "phoneNumber": phoneNumber,
        "authNumber": authNumber,
      });

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
