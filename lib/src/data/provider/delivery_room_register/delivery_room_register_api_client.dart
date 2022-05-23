import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/utils/http_env.dart';

class DeliveryRoomRegisterApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  Future<Map<String, dynamic>> registerReceivingLocation(
      Map<String, dynamic> receivingLocation) async {
    try {
      print('DeliveryRoomRegisterApiClient.registerDeliveryRoom');

      Uri url = Uri.parse("$host/api/receiving-locations");
      String body = jsonEncode(receivingLocation);
      final Response response = await http.post(
        url,
        headers: HttpEnv.contentType,
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        receivingLocation["id"] = jsonMap["id"];
      } else if (response.statusCode == 401) {
        // TODO : 토큰 만료 처리 필요
        // refreshToken();
        return registerReceivingLocation(receivingLocation);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }
    return receivingLocation;
  }

  Future<DeliveryRoom?> registerDeliveryRoom(
      Map<String, dynamic> deliveryRoom) async {
    try {
      print('DeliveryRoomRegisterApiClient.registerDeliveryRoom');

      Uri url = Uri.parse("$host/api/delivery-rooms");
      String body = jsonEncode(deliveryRoom);
      print("   body $body");
      final Response response = await http.post(
        url,
        headers: HttpEnv.contentType,
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return DeliveryRoom.fromJson(jsonMap);
      } else if (response.statusCode == 401) {
        // TODO : 토큰 만료 처리 필요
        // refreshToken();
        return registerDeliveryRoom(deliveryRoom);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
