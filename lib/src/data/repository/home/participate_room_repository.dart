import 'package:dio/dio.dart';
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
import 'package:share_delivery/src/data/provider/home/participate_room_api_client.dart';

class ParticipateRoomRepository {
  ParticipateRoomApiClient apiClient;

  ParticipateRoomRepository({required this.apiClient});

  Future<String> participateDeliveryRoom(
      int roomId, List<Menu> menuList) async {
    print('ParticipateRoomRepository.participateDeliveryRoom');
    await apiClient.requestParticipating(roomId, menuList).then((value) {
      return "ACCEPTED";
    }).catchError(
      (Object obj) {
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            if (res!.statusCode == 403) {
              print("     모집글 참여 에러 - 403");
              return "EXCEPTION";
            } else {
              print("     모집글 참여 에러 - ${res.statusCode}");
              return "ELSE";
            }
          default:
            break;
        }
      },
    );

    return "ACCEPTED";
  }
}
