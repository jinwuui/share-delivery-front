import 'package:get/get.dart';
import 'package:share_delivery/src/controller/widgets/pick_user_location_controller.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';
import 'package:share_delivery/src/data/repository/pick_user_location_repository.dart';

class PickUserLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PickUserLocationController(
        repository: PickUserLocationRepository(
          localClient: UserLocationLocalClient(),
        ),
      ),
    );
  }
}
