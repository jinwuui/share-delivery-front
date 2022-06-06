import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/report/report_controller.dart';
import 'package:share_delivery/src/data/provider/report/report_api_client.dart';
import 'package:share_delivery/src/data/repository/report/report_repository.dart';
import 'package:share_delivery/src/utils/dio_util.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = DioUtil.getDio();
    final String? host = dotenv.env['SERVER_HOST'];

    Get.put(ReportController(
      repository: ReportRepository(
        apiClient: ReportApiClient(dio, baseUrl: host!),
      ),
    ));
  }
}
