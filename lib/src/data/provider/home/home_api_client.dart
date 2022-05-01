import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class HomeApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  findDeliveryRooms(double lat, double lng) async {
    print("--- home api client - 모집글 조회");

    try {
      final queryParameters = {
        'lat': lat,
        'lng': lng,
      };

      String? accessToken = SharedPrefsUtil.instance.getString("accessToken");
      if (accessToken == null) throw Exception("accessToken is null");

      Uri uri = Uri.https(host!, '/api/delivery-rooms', queryParameters);
      Response response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: accessToken,
      });
      if (response.statusCode == 200) {
        // NOTE: 성공
        Map<String, dynamic> deliveryRoomsMap = jsonDecode(response.body);
        // return deliveryRoomsMap
        //     .map<DeliveryRoom>((json) => Delivery.fromJson(json))
        //     .toList();
        // return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
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
