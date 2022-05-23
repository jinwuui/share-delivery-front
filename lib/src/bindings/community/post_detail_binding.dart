import 'package:get/get.dart';
import 'package:share_delivery/src/controller/community/post_detail_controller.dart';

class PostDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PostDetailController());
  }
}
