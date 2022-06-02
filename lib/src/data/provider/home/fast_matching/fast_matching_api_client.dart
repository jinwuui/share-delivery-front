// import 'dart:convert';
//
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// class FastMatchingApiClient {
//   final String? host = dotenv.env['SERVER_HOST'];
//
//   Future<bool> requestFastMatching(String tag) async {
//     try {
//       print('FastMatchingApiClient.requestParticipating');
//
//       Uri url = Uri.parse("$host/api/delivery-rooms/");
//       String body = jsonEncode({});
//       final Response response = await http.post(url, body: body);
//
//       if (response.statusCode == 200) {
//         return true;
//       } else if (response.statusCode == 401) {
//         // TODO : 토큰 만료 처리
//         // await refreshToken();
//         return requestFastMatching(tag);
//       } else if (response.statusCode == 403) {
//         // 403 Forbidden
//         return false;
//       } else {
//         throw Exception(response.body);
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }

import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";
import 'package:share_delivery/src/data/model/home/fast_matching/fast_matching_request_dto/fast_matching_request_dto.dart';
import 'package:share_delivery/src/data/model/home/fast_matching/fast_matching_response_dto/fast_matching_response_dto.dart';

part "fast_matching_api_client.g.dart";

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class FastMatchingApiClient {
  factory FastMatchingApiClient(Dio dio, {String baseUrl}) =
      _FastMatchingApiClient;

  @POST("/api/fast-delivery-rooms/participate")
  Future<FastMatchingResponseDTO> requestFastMatching(
    @Query("latitude") double latitude,
    @Query("longitude") double longitude,
    @Body() FastMatchingRequestDTO fastMatchingTag,
  );
}
