// import 'dart:convert';
//
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:share_delivery/src/controller/login/authentication_controller.dart';
// import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
// import 'package:share_delivery/src/data/model/user/user/user.dart';
//
// class ParticipateRoomApiClient {
//   final String? host = dotenv.env['SERVER_HOST'];
//
//   Future<String> requestParticipating(int roomId, List<Menu> menuList) async {
//     try {
//       print('ParticipateRoomApiClient.requestParticipating');
//
//       AuthenticationController controller =
//           Get.find<AuthenticationController>();
//       User user = controller.state.props.first as User;
//
//       Uri url = Uri.parse("$host/api/delivery-rooms/$roomId");
//       var response = await http.post(url, body: {
//         "accountId": user.accountId.toString(),
//         "menuList": jsonEncode(menuList),
//       });
//
//       if (response.statusCode == 200) {
//         return "ACCEPTED";
//       } else if (response.statusCode == 401) {
//         // TODO : 토큰 만료 처리
//         // await refreshToken();
//         return requestParticipating(roomId, menuList);
//       } else if (response.statusCode == 403) {
//         // 403 Forbidden
//         return response.body;
//       } else {
//         throw Exception(response.body);
//       }
//     } catch (e) {
//       print(e);
//       return "EXCEPTION";
//     }
//   }
// }
//

import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';

part 'participate_room_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class ParticipateRoomApiClient {
  factory ParticipateRoomApiClient(Dio dio, {String baseUrl}) =
      _ParticipateRoomApiClient;

  @POST("/api/delivery-rooms/{deliveryRoomId}/entry-orders")
  Future<void> requestParticipating(
    @Path() int deliveryRoomId,
    @Body() List<Menu> menuList,
  );
}
