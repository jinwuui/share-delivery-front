import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/home/fast_matching/fast_matching_controller.dart';
import 'package:share_delivery/src/data/provider/home/fast_matching/fast_matching_api_client.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';
import 'package:share_delivery/src/data/repository/home/fast_matching/fast_matching_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class FastMatchingBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioUtil.getDio();
    final String host = dotenv.get('SERVER_HOST');

    Get.put(
      FastMatchingController(
        repository: FastMatchingRepository(
          apiClient: FastMatchingApiClient(dio, baseUrl: host),
          localClient: UserLocationLocalClient(),
        ),
      ),
    );
  }
}
