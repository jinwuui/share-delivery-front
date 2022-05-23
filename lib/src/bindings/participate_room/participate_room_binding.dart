import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/participate_room/participate_room_controller.dart';
import 'package:share_delivery/src/data/provider/home/participate_room_api_client.dart';
import 'package:share_delivery/src/data/repository/home/participate_room_repository.dart';

class ParticipateRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ParticipateRoomController(
        repository: ParticipateRoomRepository(
          apiClient: ParticipateRoomApiClient(),
        ),
      ),
    );
  }
}
