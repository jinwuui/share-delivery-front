import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_register/post_register_controller.dart';
import 'package:share_delivery/src/data/provider/community/post_register/post_register_api_client.dart';
import 'package:share_delivery/src/data/repository/community/post_register/post_register_repository.dart';

class PostRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PostRegisterController(
        repository: PostRegisterRepository(
          apiClient: PostRegisterApiClient(),
        ),
      ),
    );
  }
}
