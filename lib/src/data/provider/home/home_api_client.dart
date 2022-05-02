import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:share_delivery/src/data/model/delivery_room/delivery_room.dart';

class HomeApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  findDeliveryRooms(double lat, double lng) async {
    print("--- home api client - 모집글 조회");

    try {
      final queryParameters = {
        'lat': lat,
        'lng': lng,
      };

      // access token 확인
      // String? accessToken = SharedPrefsUtil.instance.getString("accessToken");
      String? accessToken = 'dummy';
      if (accessToken == null) throw Exception("accessToken is null");

      /*** NOTE : json to list test
          String test =
          "[ {\"name\": \"가나다\", \"age\": 123}, {\"name\": \ㅈ"가나1\", \"age\": 133}, {\"name\": \"rkske\", \"age\": 234} ]";
          final parsed = jsonDecode(test).cast<Map<String, dynamic>>();
          List<Test> parsedRet =
          parsed.map<Test>((json) => Test.fromJson(json)).toList();
          print(parsedRet);
       */

      // http 요청
      Uri uri = Uri.https(host!, '/api/delivery-rooms', queryParameters);
      Response response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: accessToken,
      });

      // 응답 확인
      if (response.statusCode == 200) {
        // NOTE: 성공
        final decodeResult = jsonDecode(response.body).cast();

        return decodeResult
            .map<DeliveryRoom>((json) => DeliveryRoom.fromJson(json))
            .toList();
      } else if (response.statusCode == 204) {
        // NOTE: 모집글 없음
        return [];
      } else if (response.statusCode == 401) {
        // NOTE: 토큰 만료

      } else {
        // NOTE: 그외 에러
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
