import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/community_controller.dart';
import 'package:share_delivery/src/data/provider/community/community_repository.dart';
import 'package:share_delivery/src/data/provider/community/post/community_api_client.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CommunityController(
        repository: CommunityRepository(
          apiClient: CommunityApiClient(DioUtil.getDio()),
          localClient: UserLocationLocalClient(),
        ),
      ),
    );
  }
}
