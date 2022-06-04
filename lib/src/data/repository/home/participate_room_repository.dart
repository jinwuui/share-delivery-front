import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/delivery_room/menu/menu.dart';
import 'package:share_delivery/src/data/provider/home/participate_room_api_client.dart';

class ParticipateRoomRepository {
  ParticipateRoomApiClient apiClient;

  ParticipateRoomRepository({required this.apiClient});

  Future<String> participateDeliveryRoom(
      int roomId, List<Menu> menuList) async {
    Logger().v(menuList);

    await apiClient.requestParticipating(roomId, menuList).then((value) {
      Logger().i("모집글 참여 성공");
      return "ACCEPTED";
    }).catchError(
      (Object obj) {
        Logger().e(obj);
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

    Logger().w("모집글 참여 - 예상치 못한 흐름");
    return "ELSE";
  }
}
