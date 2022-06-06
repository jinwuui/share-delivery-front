import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/participate_room/participate_room_controller.dart';
import 'package:share_delivery/src/data/provider/home/participate_room_api_client.dart';
import 'package:share_delivery/src/data/repository/home/participate_room_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class ParticipateRoomBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioUtil.getDio();
    final String host = dotenv.get('SERVER_HOST');

    Get.put(
      ParticipateRoomController(
        repository: ParticipateRoomRepository(
          apiClient: ParticipateRoomApiClient(dio, baseUrl: host),
        ),
      ),
    );
  }
}
