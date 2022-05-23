import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FastMatchingApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  Future<bool> requestFastMatching(String tag) async {
    try {
      print('FastMatchingApiClient.requestParticipating');

      Uri url = Uri.parse("$host/api/delivery-rooms/");
      String body = jsonEncode({});
      final Response response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        // TODO : 토큰 만료 처리
        // await refreshToken();
        return requestFastMatching(tag);
      } else if (response.statusCode == 403) {
        // 403 Forbidden
        return false;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
