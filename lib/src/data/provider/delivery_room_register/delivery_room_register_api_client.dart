import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class DeliveryRoomRegisterApiClient {
  final String? host = dotenv.env['SERVER_HOST'];

  Future<bool> registerDeliveryRoom(Map deliveryRoom) async {
    try {
      print("-- 모집글 등록");
      Uri url = Uri.parse("$host/api/delivery-rooms");
      final Response response = await http.post(url, body: deliveryRoom);

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        // TODO : 토큰 만료 처리
        // refreshToken();
        return registerDeliveryRoom(deliveryRoom);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
