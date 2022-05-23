import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/fast_matching/fast_matching_controller.dart';
import 'package:share_delivery/src/data/provider/home/fast_matching/fast_matching_api_client.dart';
import 'package:share_delivery/src/data/repository/home/fast_matching/fast_matching_repository.dart';

class FastMatchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      FastMatchingController(
        repository: FastMatchingRepository(
          apiClient: FastMatchingApiClient(),
        ),
      ),
    );
  }
}
