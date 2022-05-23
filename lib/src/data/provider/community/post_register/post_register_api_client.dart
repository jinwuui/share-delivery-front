import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:share_delivery/src/utils/http_env.dart';

class PostRegisterApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  Future<Map<String, dynamic>> registerPost(
      String content, String topic) async {
    print('PostRegisterApiClient.registerPost');
    print('   $content');
    print('   $topic');

    try {
      final uri = Uri.parse('$host/api/post');
      String body = jsonEncode({
        "content": content,
        "topic": topic,
      });
      final response = await http.post(
        uri,
        headers: HttpEnv.contentType,
        body: body,
      );

      if (response.statusCode == 202) {
      } else {}
    } catch (e) {
      print(e);
    }

    // NOTE : 임시로 적은 return 값
    return {};
  }
}
