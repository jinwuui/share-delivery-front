import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_detail_controller.dart';
import 'package:share_delivery/src/data/provider/community/post/community_api_client.dart';
import 'package:share_delivery/src/data/repository/community/post_detail/post_detail_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PostDetailController(
        repository: PostDetailRepository(
          apiClient: CommunityApiClient(DioUtil.getDio()),
        ),
      ),
    );
  }
}
