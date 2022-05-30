import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_register/post_register_controller.dart';
import 'package:share_delivery/src/data/provider/community/post/community_api_client.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';
import 'package:share_delivery/src/data/repository/community/post_register/post_register_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class PostRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PostRegisterController(
        repository: PostRegisterRepository(
          apiClient: CommunityApiClient(DioUtil.getDio()),
          userLocationLocalClient: UserLocationLocalClient(),
        ),
      ),
    );
  }
}
