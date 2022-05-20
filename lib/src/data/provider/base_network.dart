import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  // static final String baseUrl = "https://covid19.mathdro.id/api";
  static final String baseUrl = dotenv.env['SERVER_HOST']!;

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final fullUrl = baseUrl + "/" + partUrl;
    final response = await http.get(Uri.parse(fullUrl));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;

    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }
}
